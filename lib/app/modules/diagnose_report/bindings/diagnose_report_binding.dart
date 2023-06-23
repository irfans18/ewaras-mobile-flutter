import 'package:get/get.dart';

import '../controllers/diagnose_report_controller.dart';

class DiagnoseReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiagnoseReportController>(
      () => DiagnoseReportController(),
    );
  }
}
