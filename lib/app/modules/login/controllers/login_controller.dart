import 'package:ewarasm/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}


  redirectToRegister(){
    Get.toNamed(Routes.REGISTER);
  }
  redirectOffHome() {
    Get.offNamed(Routes.HOME);
  }
}
