import 'package:get/get.dart';

import 'navigation_controller.dart';

class VitalSignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
  }
}
