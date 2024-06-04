import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import '../../domain/use_case/uc_usecase.dart';

class LoginController extends GetxController {
  final UCUseCase userUseCase = Get.find();
  var userV = false;
  var email = ''.obs;
  var password = ''.obs;

  veriUser(email, password) async {
    logInfo("verifying user");
    if (kDebugMode) {
      print(email);
    }
    return await userUseCase.getUserByEmail(email, password);
  }
}
