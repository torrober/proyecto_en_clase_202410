import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:proyecto_en_clase201410/domain/models/client.dart';

import '../models/report.dart';
import '../repositories/repository.dart';

class USUseCase {
  final Repository _repository = Get.find();

  USUseCase();

  Future<List<Client>> getClients() async {
    logInfo("Getting clients from UseCase");
    return await _repository.getClients();
  }

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