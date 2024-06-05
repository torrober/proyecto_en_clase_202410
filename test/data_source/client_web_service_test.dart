import 'package:collection/collection.dart';
import 'package:loggy/loggy.dart';
import 'package:proyecto_en_clase201410/data/datasources/remote/client_datasource.dart';
import 'package:proyecto_en_clase201410/domain/models/client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;


void main() {
  late ClientDataSource dataSource; // Declared as late, initialized in setUp
  late http.Client httpClient; // Declared as late, initialized in setUp
  late Client newClient; // User without an ID yet

  setUp(() {
    httpClient = http.Client();
    dataSource = ClientDataSource(client: httpClient);
    newClient = Client(
        id: 502,
        name: 'Cliente Test');
  });

  tearDown(() {
    httpClient.close(); // Close the client to clean up resources
  });

  test('Create, Retrieve, Update, and Delete an entry', () async {
    // Step 1: Create an entry
    bool createResult = await dataSource.addClient(newClient);
    expect(createResult, isTrue);

    // Step 2: Retrieve the user to get the ID
    List<Client> clients = await dataSource.getClients();
    // Using firstWhere with orElse to handle the case where no user is found
    Client? createdClient =
        clients.firstWhereOrNull((client) => client.id == newClient.id);

    // // Check if the user was indeed found
    expect(createdClient, isNotNull);

    // // Step 3: Update the entry
    createdClient!.name=
        'Updated'; // Safe because createdUser is not null here
    bool updateResult = await dataSource.updateClient(createdClient);
    //print('updateResult: $updateResult');
    logInfo('updateResult: $updateResult');
    expect(updateResult, isTrue);
    //print('deleteUser: ${createdUser.id}');
    // Step 4: Delete the entry
    bool deleteResult = await dataSource
        .deleteClient(createdClient.id!); // Assert non-null ID with '!'
    expect(deleteResult, isTrue);
  });
}