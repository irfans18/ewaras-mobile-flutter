import 'package:get/get.dart';

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;
  // final List<Widget> pages = [VitalSignView(), VitalSignView(), VitalSignView(), SettingView()];

  void changePage(int index) {
    selectedIndex.value = index;
    update();

  }
  // void onItemTapped(int index) {
  //   _selectedIndex.value = index;
  //   update();
  // }
}
