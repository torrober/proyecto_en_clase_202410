import 'package:collection/collection.dart';
import 'package:loggy/loggy.dart';
import 'package:proyecto_en_clase201410/data/datasources/remote/report_datasource.dart';
import 'package:proyecto_en_clase201410/domain/models/report.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;


void main() {
  late ReportsDataSource dataSource; // Declared as late, initialized in setUp
  late http.Client httpClient; // Declared as late, initialized in setUp
  late Report newReport; // User without an ID yet

  setUp(() {
    httpClient = http.Client();
    dataSource = ReportsDataSource(client: httpClient);
    newReport = Report(
        id: 502,
        idUS: 501,
        score: 3,
        duracion: 4,
        horaInicio: "asdasdasd",
        nameClient: "Ernesto garcia",
        description: "Reporte de prueba. Si Dios quiere sale bien");
  });

  tearDown(() {
    httpClient.close(); // Close the client to clean up resources
  });

  test('Create, Retrieve, Update, and Delete an entry', () async {
    // Step 1: Create an entry
    bool createResult = await dataSource.addReport(newReport);
    expect(createResult, isTrue);

    // Step 2: Retrieve the user to get the ID
    List<Report> reports = await dataSource.getReports();
    // Using firstWhere with orElse to handle the case where no user is found
    Report? createdReport =
        reports.firstWhereOrNull((report) => report.id == newReport.id);

    // // Check if the user was indeed found
    expect(createdReport, isNotNull);

    // // Step 3: Update the entry
    createdReport!.nameClient =
        'Updated name client'; // Safe because createdUser is not null here
    bool updateResult = await dataSource.updateReport(createdReport);
    //print('updateResult: $updateResult');
    logInfo('updateResult: $updateResult');
    expect(updateResult, isTrue);
    //print('deleteUser: ${createdUser.id}');
    // Step 4: Delete the entry
    bool deleteResult = await dataSource
        .deleteReport(10); // Assert non-null ID with '!'
    expect(deleteResult, isTrue);
  });
}