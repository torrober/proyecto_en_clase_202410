import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:proyecto_en_clase201410/domain/models/client.dart';

import '../../domain/models/report.dart';
import '../../domain/use_case/us_usecase.dart';

class USController extends GetxController {
  final RxList<Report> _reports = <Report>[].obs;
  final RxList<Client> _clients = <Client>[].obs;
  final USUseCase userSUseCase = Get.find();

  List<Report> get reports => _reports;
  List<Client> get clients => _clients;

  @override
  void onInit() {
    getReports();
    getClients();
    super.onInit();
  }

  getClients() async {
    logInfo("Getting clients");
    _clients.value = await userSUseCase.getClients();
  }

  getReports() async {
    logInfo("Getting reports");
    _reports.value = await userSUseCase.getReports();
  }

  addReport(Report report) async {
    logInfo("Add report");
    await userSUseCase.addReport(report);
    await getReports();
  }

  updateReport(Report report) async {
    logInfo("Update report");
    await userSUseCase.updateReport(report);
    await getReports();
  }

  void deleteReport(int id) async {
    await userSUseCase.deleteReport(id);
    await getReports();
  }
  // void simulateProcess() async {
  //   await userUseCase.simulateProcess();
  // }
}
