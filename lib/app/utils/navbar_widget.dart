import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigation_controller.dart';

class NavigationBarWidget extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());
  // final NavigationController navigationController =
  //     Get.find<NavigationController>();
  

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        fixedColor: Color.fromARGB(255, 58, 41, 135),
        unselectedItemColor: Color.fromARGB(255, 154, 145, 202),
        currentIndex: navigationController.selectedIndex.value,
        onTap: navigationController.changePage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Page 2'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Page 3'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
      ),
    );
  }
}
