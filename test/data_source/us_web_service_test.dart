import 'package:collection/collection.dart';
import 'package:loggy/loggy.dart';
import 'package:proyecto_en_clase201410/data/datasources/remote/us_datasource.dart';
import 'package:proyecto_en_clase201410/domain/models/us.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;


void main() {
  late USDataSource dataSource; // Declared as late, initialized in setUp
  late http.Client httpClient; // Declared as late, initialized in setUp
  late User newUser; // User without an ID yet

  setUp(() {
    httpClient = http.Client();
    dataSource = USDataSource(client: httpClient);
    newUser = User(
        id: 502,
        firstName: 'Usuario Test',
        email: 'emailSuperUnico@test.com',
        password: 'passwordTest');
  });

  tearDown(() {
    httpClient.close(); // Close the client to clean up resources
  });

  test('Create, Retrieve, Update, and Delete an entry', () async {
    // Step 1: Create an entry
    bool createResult = await dataSource.addUser(newUser);
    expect(createResult, isTrue);

    // Step 2: Retrieve the user to get the ID
    List<User> users = await dataSource.getUsers();
    // Using firstWhere with orElse to handle the case where no user is found
    User? createdUser =
        users.firstWhereOrNull((user) => user.email == newUser.email);

    // // Check if the user was indeed found
    expect(createdUser, isNotNull);

    // // Step 3: Update the entry
    createdUser!.firstName =
        'Updated'; // Safe because createdUser is not null here
    bool updateResult = await dataSource.updateUser(createdUser);
    //print('updateResult: $updateResult');
    logInfo('updateResult: $updateResult');
    expect(updateResult, isTrue);
    //print('deleteUser: ${createdUser.id}');
    // Step 4: Delete the entry
    bool deleteResult = await dataSource
        .deleteUser(createdUser.id!); // Assert non-null ID with '!'
    expect(deleteResult, isTrue);
  });
}