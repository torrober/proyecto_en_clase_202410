import '../../data/client_datasource.dart';
import '../../data/report_datasource.dart';
import '../../data/us_datasource.dart';
import '../models/us.dart';
import '../models/client.dart';
import '../models/report.dart';

class Repository {
  late USDataSource _userDatatasource;
  late ClientDataSource _clientDataSource;
  late ReportsDataSource _reportsDataSource;

  // the base url of the API should end without the /
  // final String _baseUrl =
  //     "http://ip172-18-0-103-cjvmcv8gftqg00dhebr0-8000.direct.labs.play-with-docker.com";

  Repository() {
    _userDatatasource = USDataSource();
    _clientDataSource = ClientDataSource();
    _reportsDataSource = ReportsDataSource();
  }

  // Future<bool> login(String email, String password) async {
  //   token = await _authenticationDataSource.login(_baseUrl, email, password);
  //   return true;
  // }

  // Future<bool> signUp(String email, String password) async =>
  //     await _authenticationDataSource.signUp(_baseUrl, email, password);

  // Future<bool> logOut() async => await _authenticationDataSource.logOut();

//Usuarios soportes
  Future<List<User>> getUsers() async => await _userDatatasource.getUsers();

  Future<bool> addUser(User user) async =>
      await _userDatatasource.addUser(user);

  Future<bool> updateUser(User user) async =>
      await _userDatatasource.updateUser(user);

  Future<bool> deleteUser(int id) async =>
      await _userDatatasource.deleteUser(id);

  // Clientes
  Future<List<Client>> getClients() async =>
      await _clientDataSource.getClients();

  Future<bool> addClient(Client client) async =>
      await _clientDataSource.addClient(client);

  Future<bool> updateClient(Client client) async =>
      await _clientDataSource.updateClient(client);

  Future<bool> deleteClient(int id) async =>
      await _clientDataSource.deleteClient(id);

  //Reportes
  Future<List<Report>> getReports() async =>
      await _reportsDataSource.getReports();

  Future<bool> addReport(Report report) async =>
      await _reportsDataSource.addReport(report);

  Future<bool> updateReport(Report report) async =>
      await _reportsDataSource.updateReport(report);

  Future<bool> deleteReport(int id) async =>
      await _reportsDataSource.deleteReport(id);

  // Future<bool> simulateProcess() async =>
  //     await _userDatatasource.simulateProcess(_baseUrl, token);
}
