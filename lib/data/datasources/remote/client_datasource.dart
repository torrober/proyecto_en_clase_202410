import 'dart:convert';
import 'package:loggy/loggy.dart';
import '../../../../../domain/models/client.dart';
import 'package:http/http.dart' as http;

class ClientDataSource {
  final String apiKey = 'oSEaCD';
  final http.Client httpClient;
  
  ClientDataSource({http.Client? client}) : httpClient = client ?? http.Client();


  Future<List<Client>> getClients() async {
    List<Client> clients = [];
    var request = Uri.parse("https://retoolapi.dev/$apiKey/clientData")
        .resolveUri(Uri(queryParameters: {
      "format": 'json',
    }));

    //var response = await http.get(request);
    var response = await httpClient.get(request);


    if (response.statusCode == 200) {
      //logInfo(response.body);
      final data = jsonDecode(response.body);

      clients = List<Client>.from(data.map((x) => Client.fromJson(x)));
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }

    return Future.value(clients);
  }

  Future<bool> addClient(Client client) async {
    logInfo("Web service, Adding client");
    //final response = await http.post
    final response = await httpClient.post(
      Uri.parse("https://retoolapi.dev/$apiKey/clientData"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(client.toJson()),
    );

    if (response.statusCode == 201) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> updateClient(Client client) async {
    //final response = await http.put
    final response = await httpClient.put(
      Uri.parse("https://retoolapi.dev/$apiKey/clientData/${client.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(client.toJson()),
    );

    if (response.statusCode == 201) {
      logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> deleteClient(int id) async {
    //final response = await http.delete
    final response = await httpClient.delete(
      Uri.parse("https://retoolapi.dev/$apiKey/clientData/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 201) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  // Future<bool> simulateProcess(String baseUrl, String token) async {
  //   final response = await http.get(
  //     Uri.parse("$baseUrl/me"),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': 'Bearer $token'
  //     },
  //   );

  //   logInfo(response.statusCode);
  //   if (response.statusCode == 200) {
  //     logInfo('simulateProcess access ok');
  //     return Future.value(true);
  //   } else {
  //     logError("Got error code ${response.statusCode}");
  //     return Future.error('Error code ${response.statusCode}');
  //   }
  // }
  
}