import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/models/vital_sensor_model.dart';

class VitalSignController extends GetxController {
  var isLoading = false.obs;
  var vitalSensorData = <VitalSensor>[].obs;

  @override
  void onInit() {
    super.onInit();
    create();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  String getAverageOxygenSaturation() {
    var count = 0;
    var i = 0;
    for (final datum in vitalSensorData) {
      count += datum.oxygenSaturation!;
      i++;
    }
    int avg = count ~/ i;
    return avg.toString();
  }

  String getAverageHeartRate() {
    var count = 0;
    var i = 0;
    for (final datum in vitalSensorData) {
      count += datum.heartRate!;
      i++;
    }
    int avg = (count ~/ i);
    return avg.toString();
  }

  Future<List<VitalSensor>> readMockData() async {
    final String jsonString =
        await rootBundle.loadString('assets/MOCK_DATA.json');
    // final data = jsonDecode(jsonString);
    // VitalSensor VitalSensor = VitalSensor.fromJson(data);
    // debugPrint(VitalSensor.toString());
    var jsonData = jsonDecode(jsonString) as List<dynamic>;
    jsonData.sort((a, b) {
      DateTime dateTimeA = DateTime.parse(a['dateTime']);
      DateTime dateTimeB = DateTime.parse(b['dateTime']);
      return dateTimeA.compareTo(dateTimeB);
    });
    return jsonData
        .map<VitalSensor>((json) => VitalSensor.fromJson(json))
        .toList();
    // debugPrint(data.toString());
    // return data;
  }

  create() async {
    isLoading.value = true;
    vitalSensorData.value = await readMockData();
    // await Future.delayed(Duration(seconds: 5));
    // for (final datum in vitalSensorData) {
    //   print('DateTime: ${datum.dateTime}');
    //   print('BPM: ${datum.heartRate}');
    //   print('Oxygen: ${datum.oxygenSaturation}');
    //   print('---');
    // }
    // debugPrint("ASD");
    isLoading.value = false;
  }
}
