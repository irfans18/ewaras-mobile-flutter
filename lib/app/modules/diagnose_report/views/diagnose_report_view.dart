import 'package:ewarasm/app/utils/style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/diagnose_report_controller.dart';

class DiagnoseReportView extends GetView<DiagnoseReportController> {
  @override
  Widget build(BuildContext context) {
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
            Text("Symtomp Result", style: titleTextStyle),
            const SizedBox(
              height: 16,
            ),
            Placeholder(
              color: headerTextColor,
              fallbackHeight: 200,
              // fallbackWidth: 10,
            ),
            const SizedBox(
              height: 16,
            ),
            Center(child: Text("Hypoxia Detected", style: titleTextStyle)),
            const SizedBox(
              height: 16,
            ),
            Container(
                padding: const EdgeInsets.all(defaultMargin),
                decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(
                      color: secondaryColor,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Text(
                  diagnose,
                  style: primaryTextStyle,
                )),
            const SizedBox(
              height: 24,
            ),
            TextButton(
              child: Text('Test Again', style: buttonTextStyle),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                // foregroundColor: buttonTextColor,
                backgroundColor: buttonColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
              onPressed: () {
                // print('Pressed');
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextButton(
              child: Text('Seek Help', style: warningTextStyle),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                // foregroundColor: buttonTextColor,
                backgroundColor: warningColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
              onPressed: () {
                // print('Pressed');
              },
            ),
            // Align(alignment: Alignment.bottomLeft, child: inputIdea()),
          ],
        ),
      ),
    );
  }
}
