import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:loggy/loggy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../domain/models/us.dart';
import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

class USDataSource {
  final String apiKey = 'oZkfzz';
  final http.Client httpClient;
  USDataSource({http.Client? client}) : httpClient = client ?? http.Client();

  Future<List<User>> getUsers() async {
    List<User> users = [];
    var request = Uri.parse("https://retoolapi.dev/$apiKey/USdata")
        .resolveUri(Uri(queryParameters: {
      "format": 'json',
    }));
    var response = await httpClient.get(request);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (response.statusCode == 200) {
      await prefs.setString('users', response.body);
      final data = jsonDecode(response.body);
      print('prefs written');
      users = List<User>.from(data.map((x) => User.fromJson(x)));
    } else {
      logError("Got error code ${response.statusCode}, trying to read backup.");
      final String? cachedUsers = prefs.getString('users');
      if (cachedUsers != null) {
        final data = jsonDecode(cachedUsers);
        users = List<User>.from(data.map((x) => User.fromJson(x)));
        logError("Using cached users due to error code ${response.statusCode}");
      } else {
        return Future.error(
            'Error code ${response.statusCode} and no cached users available');
      }
    }
    return Future.value(users);
  }

  Future<User?> getUserByEmail(String email, String password) async {
    List<User> users = [];
    User? user;

    // Verifies if the device has an internet connection
    bool hasConnection = await checkInternetConnection();

    if (hasConnection) {
      // If there is connection, get users from the database or API
      users = await getUsers();
    } else {
      // If there is no connection, get users stored in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? cachedUsers = prefs.getString('users');

      if (cachedUsers != null) {
        List<dynamic> userJsonList = jsonDecode(cachedUsers);
        users = userJsonList.map((json) => User.fromJson(json)).toList();
      }
    }

    try {
      user = users.firstWhere(
          (user) => user.email == email && user.password == password);
      return user;
    } catch (e) {
      logError("User with email $email not found");
      return null;
    }
  }

  Future<bool> addUser(User user) async {
    logInfo("Web service, Adding user");

    final response = await httpClient.post(
      Uri.parse("https://retoolapi.dev/$apiKey/USdata"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> updateUser(User user) async {
    final response = await httpClient.put(
      Uri.parse("https://retoolapi.dev/$apiKey/USdata/${user.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      print(user.id);
      print("Usuario Actualizado");
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> deleteUser(int id) async {
    final response = await httpClient.delete(
      Uri.parse("https://retoolapi.dev/$apiKey/USdata/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(id);
      print("Usuario Borrado");
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> checkInternetConnection() async {
    // Implement the logic to check for internet connection
    // For example, using the connectivity_plus package
    return Connectivity().checkConnectivity() != ConnectivityResult.none;
    //return true; // Placeholder
  }
}
