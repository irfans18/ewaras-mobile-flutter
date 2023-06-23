import 'package:ewarasm/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {


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

  redirectOffLogin(){
    Get.offNamed(Routes.LOGIN);
  }
}
