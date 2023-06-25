import 'package:ewarasm/app/modules/login/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    // Get.put(AuthController());
  }
}
