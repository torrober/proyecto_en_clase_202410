import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../models/us.dart';
import '../models/client.dart';
import '../models/report.dart';
import '../repositories/repository.dart';

class UCUseCase {
  final Repository _repository = Get.find();

  UCUseCase();

  Future<List<User>> getUsers() async {
    logInfo("Getting users from UseCase");
    return await _repository.getUsers();
  }
  Future<User?> getUserByEmail(email,password) async {
    logInfo("Getting user by email from UseCase");
    return await _repository.getUserByEmail(email,password);
  }

  Future<void> addUser(User user) async => await _repository.addUser(user);

  Future<void> updateUser(User user) async =>
      await _repository.updateUser(user);

  deleteUser(int id) async => await _repository.deleteUser(id);

  Future<List<Client>> getClients() async {
    logInfo("Getting users from UseCase");
    return await _repository.getClients();
  }

  Future<void> addClient(Client client) async =>
      await _repository.addClient(client);

  Future<void> updateClient(Client client) async =>
      await _repository.updateClient(client);

  Future<void> deleteClient(int id) async => await _repository.deleteClient(id);



  Future<List<Report>> getReports() async {
    logInfo("Getting users from UseCase");
    return await _repository.getReports();
  }

  Future<void> addReport(Report report) async =>
      await _repository.addReport(report);

  Future<void> updateReport(Report report) async =>
      await _repository.updateReport(report);

  Future<void> deleteReport(int id) async => await _repository.deleteReport(id);
  //simulateProcess() async => await _repository.simulateProcess();
}
