import 'package:ewarasm/app/modules/login/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/style.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  // final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
  // final AuthController _authController = Get.find<AuthController>(tag:'logout');
  final AuthController _authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(''),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: backgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            Text("Settings", style: titleTextStyle),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Container(
                height: 120,
                width: 120,
                child: Placeholder(
                  color: headerTextColor,
                  // fallbackHeight: 150,
                  // fallbackWidth: 150,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(child: Text("Julia Mario", style: titleTextStyle)),
            const SizedBox(
              height: 8,
            ),
            Center(child: Text("juliamario@gmail.com", style: headerTextStyle)),
            const SizedBox(
              height: 20,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person,
                            color: secondaryColor,
                          ),
                          label: Text(
                            'Measure Vital Sign',
                            style: settingTextStyle,
                          )),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: secondaryColor,
                      )
                    ],
                  ),
                  onTap: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: secondaryColor,
                        ),
                        label: Text(
                          'Consult Doctor',
                          style: settingTextStyle,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: secondaryColor,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: secondaryColor,
                        ),
                        label: Text(
                          'My Appointments',
                          style: settingTextStyle,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: secondaryColor,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.chat_rounded,
                          color: secondaryColor,
                        ),
                        label: Text(
                          'Chat',
                          style: settingTextStyle,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: secondaryColor,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shield_moon_outlined,
                          color: secondaryColor,
                        ),
                        label: Text(
                          'My Reports',
                          style: settingTextStyle,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: secondaryColor,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings_accessibility,
                          color: secondaryColor,
                        ),
                        label: Text(
                          'Settings',
                          style: settingTextStyle,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: secondaryColor,
                        ))
                  ],
                ),
                InkWell(
                  onTap: () async => {
                    await _authController.handleSignOut(),
                    controller.redirectOffLogin()
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.logout,
                            color: secondaryColor,
                          ),
                          label: Text(
                            'Logout',
                            style: settingTextStyle,
                          )),
                      IconButton(
                          onPressed: () async => {
                                await _authController.handleSignOut(),
                                controller.redirectOffLogin()
                              },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: secondaryColor,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
