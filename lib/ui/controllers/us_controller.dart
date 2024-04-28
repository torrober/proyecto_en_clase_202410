import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/models/report.dart';
import '../../domain/use_case/us_usecase.dart';

class USController extends GetxController {
  final RxList<Report> _reports = <Report>[].obs;
  final USUseCase userSUseCase = Get.find();

  List<Report> get reports => _reports;

  @override
  void onInit() {
    getReports();
    super.onInit();
  }

  getReports() async {
    logInfo("Getting reports");
    _reports.value = await userSUseCase.getReports();
  }

  addReport(Report report) async {
    logInfo("Add report");
    await userSUseCase.addReport(report);
    getReports();
  }

  updateReport(Report report) async {
    logInfo("Update report");
    await userSUseCase.updateReport(report);
    getReports();
  }

  void deleteReport(int id) async {
    await userSUseCase.deleteReport(id);
    getReports();
  }
  // void simulateProcess() async {
  //   await userUseCase.simulateProcess();
  // }
}
