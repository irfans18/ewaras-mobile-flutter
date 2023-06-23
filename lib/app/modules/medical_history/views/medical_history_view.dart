import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/medical_history_controller.dart';

class MedicalHistoryView extends GetView<MedicalHistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MedicalHistoryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MedicalHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
