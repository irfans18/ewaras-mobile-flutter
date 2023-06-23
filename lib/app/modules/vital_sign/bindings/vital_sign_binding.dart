import 'package:get/get.dart';

import '../controllers/vital_sign_controller.dart';

class VitalSignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VitalSignController>(
      () => VitalSignController(),
    );
  }
}
