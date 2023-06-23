import 'package:ewarasm/app/modules/setting/controllers/setting_controller.dart';
import 'package:ewarasm/app/modules/vital_sign/controllers/vital_sign_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<VitalSignController>(
      () => VitalSignController(),
    );
    Get.lazyPut<SettingController>(
      () => SettingController(),
    );
  }
}
