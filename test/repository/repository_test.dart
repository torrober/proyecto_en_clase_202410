import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:proyecto_en_clase201410/data/datasources/remote/client_datasource.dart';
import 'package:proyecto_en_clase201410/data/datasources/remote/report_datasource.dart';
import 'package:proyecto_en_clase201410/data/datasources/remote/us_datasource.dart';
import 'package:proyecto_en_clase201410/domain/models/client.dart';
import 'package:proyecto_en_clase201410/domain/models/report.dart';
import 'package:proyecto_en_clase201410/domain/models/us.dart';
import 'package:proyecto_en_clase201410/domain/repositories/repository.dart';

class MockUSDataSource extends Mock implements USDataSource {}

class MockClientDataSource extends Mock implements ClientDataSource {}

class MockReportsDataSource extends Mock implements ReportsDataSource {}

void main() {
  group('Repository', () {
    late Repository repository;
    late MockUSDataSource mockUSDataSource;
    late MockClientDataSource mockClientDataSource;
    late MockReportsDataSource mockReportsDataSource;

    setUp(() {
      mockUSDataSource = MockUSDataSource();
      mockClientDataSource = MockClientDataSource();
      mockReportsDataSource = MockReportsDataSource();
      repository = Repository();
      repository.userDatatasource = mockUSDataSource;
      repository.clientDataSource = mockClientDataSource;
      repository.reportsDataSource = mockReportsDataSource;
    });

    test('getUsers', () async {
      // Configurar el comportamiento del mock para getUsers
      final users = [
        User(
            id: 1,
            firstName: 'John',
            email: 'john@example.com',
            password: '123456'),
        User(
            id: 2,
            firstName: 'Jane',
            email: 'jane@example.com',
            password: 'abcdef')
      ];
      when(mockUSDataSource.getUsers()).thenAnswer((_) async => users);

      // Ejecutar la prueba
      final result = await repository.getUsers();

      // Verificar que el resultado sea igual a la lista de usuarios configurada en el mock
      expect(result, equals(users));
    });

    test('addUser', () async {
      final user = User(
          id: 1,
          firstName: 'John',
          email: 'john@example.com',
          password: '123456');
      when(mockUSDataSource.addUser(user)).thenAnswer((_) async => true);

      final result = await repository.addUser(user);

      expect(result, equals(true));
    });

    test('updateUser', () async {
      final user = User(
          id: 1,
          firstName: 'John',
          email: 'john@example.com',
          password: '123456');
      when(mockUSDataSource.updateUser(user)).thenAnswer((_) async => true);

      final result = await repository.updateUser(user);

      expect(result, equals(true));
    });

    test('deleteUser', () async {
      const userId = 1;
      when(mockUSDataSource.deleteUser(userId)).thenAnswer((_) async => true);

      final result = await repository.deleteUser(userId);

      expect(result, equals(true));
    });

    test('getReports', () async {
      final reports = [
        Report(
            id: 1,
            score: 5,
            description: 'Good',
            nameClient: 'Client A',
            horaInicio: 'test prueba',
            duracion: 5,
            idUS: 1),
        Report(
            id: 2,
            score: 3,
            description: 'Average',
            nameClient: 'Client B',
            horaInicio: 'test prueba',
            duracion: 3,
            idUS: 2)
      ];
      when(mockReportsDataSource.getReports()).thenAnswer((_) async => reports);

      final result = await repository.getReports();

      expect(result, equals(reports));
    });

    test('addReport', () async {
      final report = Report(
          id: 1,
          score: 5,
          description: 'Good',
          nameClient: 'Client A',
          horaInicio: 'test prueba',
          duracion: 3,
          idUS: 1);
      when(mockReportsDataSource.addReport(report))
          .thenAnswer((_) async => true);

      final result = await repository.addReport(report);

      expect(result, equals(true));
    });

    test('updateReport', () async {
      final report = Report(
          id: 1,
          score: 5,
          description: 'Good',
          nameClient: 'Client A',
          horaInicio: "text prueba",
          duracion: 2,
          idUS: 1);
      when(mockReportsDataSource.updateReport(report))
          .thenAnswer((_) async => true);

      final result = await repository.updateReport(report);

      expect(result, equals(true));
    });

    test('deleteReport', () async {
      const reportId = 1;
      when(mockReportsDataSource.deleteReport(reportId))
          .thenAnswer((_) async => true);

      final result = await repository.deleteReport(reportId);

      expect(result, equals(true));
    });

    test('getClients', () async {
      final clients = [
        Client(id: 1, name: 'Client A'),
        Client(id: 2, name: 'Client B')
      ];
      when(mockClientDataSource.getClients()).thenAnswer((_) async => clients);

      final result = await repository.getClients();

      expect(result, equals(clients));
    });

    test('addClient', () async {
      final client = Client(id: 1, name: 'Client A');
      when(mockClientDataSource.addClient(client))
          .thenAnswer((_) async => true);

      final result = await repository.addClient(client);

      expect(result, equals(true));
    });

    test('updateClient', () async {
      final client = Client(id: 1, name: 'Client A');
      when(mockClientDataSource.updateClient(client))
          .thenAnswer((_) async => true);

      final result = await repository.updateClient(client);

      expect(result, equals(true));
    });

    test('deleteClient', () async {
      const clientId = 1;
      when(mockClientDataSource.deleteClient(clientId))
          .thenAnswer((_) async => true);

      final result = await repository.deleteClient(clientId);

      expect(result, equals(true));
    });
  });
}
