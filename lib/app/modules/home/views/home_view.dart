import 'package:ewarasm/app/utils/style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../setting/views/setting_view.dart';
import '../../vital_sign/views/vital_sign_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  VitalSignView(),
                  VitalSignView(),
                  VitalSignView(),
                  SettingView(),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: BottomNavigationBar(
                unselectedItemColor: const Color.fromARGB(255, 155, 146, 203),
                selectedItemColor: const Color.fromARGB(255, 64, 50, 109),
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                // fixedColor: Colors.red,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                elevation: 0,
                items: [
                  _bottomNavigationBarItem(
                    icon: Icons.dashboard,
                    label: 'Home',
                  ),
                  _bottomNavigationBarItem(
                    icon: Icons.bar_chart,
                    label: 'News',
                  ),
                  _bottomNavigationBarItem(
                    icon: Icons.notifications,
                    label: 'Alerts',
                  ),
                  _bottomNavigationBarItem(
                    icon: Icons.settings,
                    label: 'Setting',
                  ),
                ],
              ),
            ));
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
