import 'package:ewarasm/app/modules/login/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(
      () => SettingController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    // Get.put(AuthController());

  }
}
