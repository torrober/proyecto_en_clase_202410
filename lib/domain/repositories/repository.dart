import '../../data/datasources/remote/client_datasource.dart';
import '../../data/datasources/remote/report_datasource.dart';
import '../../data/datasources/remote/us_datasource.dart';
import '../models/us.dart';
import '../models/client.dart';
import '../models/report.dart';

class Repository {
  late USDataSource _userDatatasource;
  late ClientDataSource _clientDataSource;
  late ReportsDataSource _reportsDataSource;

  get userDatatasource => _userDatatasource;

  set userDatatasource(value) => _userDatatasource = value;

  get clientDataSource => _clientDataSource;

  set clientDataSource( value) => _clientDataSource = value;

  get reportsDataSource => _reportsDataSource;

  set reportsDataSource( value) => _reportsDataSource = value;


  Repository() {
    _userDatatasource = USDataSource();
    _clientDataSource = ClientDataSource();
    _reportsDataSource = ReportsDataSource();
  }

//Usuarios soportes
  Future<List<User>> getUsers() async => await _userDatatasource.getUsers();

  Future<bool> addUser(User user) async =>
      await _userDatatasource.addUser(user);

  Future<bool> updateUser(User user) async =>
      await _userDatatasource.updateUser(user);

  Future<bool> deleteUser(int id) async =>
      await _userDatatasource.deleteUser(id);

  Future<User?> getUserByEmail(email,password) async => await _userDatatasource.getUserByEmail(email,password);     

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
}
