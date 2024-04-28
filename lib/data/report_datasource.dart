import 'dart:convert';
import 'package:loggy/loggy.dart';
import '../../../domain/models/report.dart';
import 'package:http/http.dart' as http;

class ReportsDataSource {
  final String apiKey = 'qrhARc';

  Future<List<Report>> getReports() async {
    List<Report> reports = [];
    var request = Uri.parse("https://retoolapi.dev/$apiKey/reportData")
        .resolveUri(Uri(queryParameters: {
      "format": 'json',
    }));

    var response = await http.get(request);

    if (response.statusCode == 200) {
      logInfo(response.body);
      final data = jsonDecode(response.body);

      reports = List<Report>.from(data.map((x) => Report.fromJson(x)));
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }

    return Future.value(reports);
  }

  Future<bool> addReport(Report report) async {
    logInfo("Web service, Adding report");

    final response = await http.post(
      Uri.parse("https://retoolapi.dev/$apiKey/reportData"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(report.toJson()),
    );

    if (response.statusCode == 201) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> updateReport(Report report) async {
    final response = await http.put(
      Uri.parse("https://retoolapi.dev/$apiKey/reportData/${report.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(report.toJson()),
    );

    if (response.statusCode == 201) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> deleteReport(int id) async {
    final response = await http.delete(
      Uri.parse("https://retoolapi.dev/$apiKey/reportData/$id"),
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

  Future<bool> simulateProcess(String baseUrl, String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/me"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    logInfo(response.statusCode);
    if (response.statusCode == 200) {
      logInfo('simulateProcess access ok');
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }
  }
}