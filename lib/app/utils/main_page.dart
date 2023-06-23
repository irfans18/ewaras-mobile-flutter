import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/setting/views/setting_view.dart';
import '../modules/vital_sign/views/vital_sign_view.dart';

class MainWidget extends StatelessWidget {
  // final List<Widget> pages = [Page1(), Page2(), Page3(), Page4()];
  final List<Widget> pages = [
    VitalSignView(),
    VitalSignView(),
    VitalSignView(),
    SettingView()
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      appBar: AppBar(title: Text('GetX Navigation Bar')),
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changePage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), label: 'Page 2'),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Page 3'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Setting'),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
