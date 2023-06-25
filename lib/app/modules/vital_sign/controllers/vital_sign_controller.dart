import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/models/vital_sensor_model.dart';

class VitalSignController extends GetxController {
  var isLoading = false.obs;
  var vitalSensorData = <VitalSensor>[].obs;
  User? user;

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

  Future<void> fetchVitalSignData(String userId) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('vital_signs')
          .where('userId', isEqualTo: userId)
          .get();

      List<QueryDocumentSnapshot> documents = querySnapshot.docs;

      // Process the retrieved documents
      for (QueryDocumentSnapshot document in documents) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        // Access the individual data fields
        String dateTime = data['dateTime'];
        int heartRate = data['heart_rate'];
        Map<String, int> bloodPressure =
            data['blood_pressure'] as Map<String, int>;
        int systolic = bloodPressure['systolic']!;
        int diastolic = bloodPressure['diastolic']!;
        int respiratoryRate = data['respiratory_rate'];
        int oxygenSaturation = data['oxygen_saturation'];

        // Perform any desired operations with the data
        print('DateTime: $dateTime');
        print('Heart Rate: $heartRate');
        print('Blood Pressure - Systolic: $systolic, Diastolic: $diastolic');
        print('Respiratory Rate: $respiratoryRate');
        print('Oxygen Saturation: $oxygenSaturation');
      }
    } catch (e) {
      print('Error fetching vital sign data: $e');
    }
  }

  String getAverageOxygenSaturation() {
    var count = 0;
    var i = 0;
    int avg = 0;
    if (vitalSensorData.isNotEmpty) {
      for (final datum in vitalSensorData) {
        count += datum.oxygenSaturation!;
        i++;
      }
      avg = (count ~/ i);
    }
    return avg.toString();
  }

  String getAverageHeartRate() {
    var count = 0;
    var i = 0;
    int avg = 0;
    if (vitalSensorData.isNotEmpty) {
      for (final datum in vitalSensorData) {
        count += datum.heartRate!;
        i++;
      }
      avg = (count ~/ i);
    }
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

  String getCurrentUserId() {
    user = FirebaseAuth.instance.currentUser;
    String? userId = user?.uid;
    return userId ?? '';
  }

  Future<List<VitalSensor>> fetchUserData(userId) async {
    print(user!.uid);
    List<VitalSensor> list = [];

    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users/$userId').get();
    // final snapshot = await ref.child('users').get();
    if (snapshot.exists) {
      // print(snapshot.value);
      Map<dynamic, dynamic> userData = snapshot.value as Map<dynamic, dynamic>;
      // print(userData.toString());
      List<dynamic> vitalSignData = userData['vitalSign'];
      if (vitalSignData.isNotEmpty) {
        return vitalSignData
            .map<VitalSensor>((json) => VitalSensor.fromJson(json))
            .toList();
        // for (var data in vitalSignData) {
        //   // Access individual data points
        //   String dateTime = data['dateTime'];
        //   int heartRate = data['heart_rate'];
        //   Map<dynamic, dynamic> bloodPressure = data['blood_pressure'];
        //   int systolic = bloodPressure['systolic'];
        //   int diastolic = bloodPressure['diastolic'];
        //   int respiratoryRate = data['respiratory_rate'];
        //   int oxygenSaturation = data['oxygen_saturation'];

        //   // Use the retrieved data as needed
        //   print('DateTime: $dateTime');
        //   print('Heart Rate: $heartRate');
        //   print('Systolic: $systolic');
        //   print('Diastolic: $diastolic');
        //   print('Respiratory Rate: $respiratoryRate');
        //   print('Oxygen Saturation: $oxygenSaturation');
        // }
      }
      // var jsonString = snapshot.value.toString();
      // var jsonData = jsonDecode(jsonString) as List<dynamic>;
      // jsonData.sort((a, b) {
      //   DateTime dateTimeA = DateTime.parse(a['dateTime']);
      //   DateTime dateTimeB = DateTime.parse(b['dateTime']);
      //   return dateTimeA.compareTo(dateTimeB);
      // });
      // return jsonData
      //     .map<VitalSensor>((json) => VitalSensor.fromJson(json))
      //     .toList();
    } else {
      print('No data available.');
    }
    return list;
  }

  getData(String data) {
    var jsonData = json.decode(data) as List<dynamic>;
    vitalSensorData.value = jsonData
        .map<VitalSensor>((json) => VitalSensor.fromJson(json))
        .toList();
  }

  Future<List<VitalSensor>> retrieveVitalSignData(String userId) async {
    List<VitalSensor> vitalSigns = [];
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('users/$userId/vitalSign');
    DatabaseEvent databaseEvent = await databaseReference.once();

    var data = databaseEvent.snapshot.value as List<dynamic>;

    data.forEach((data) {
      VitalSensor vitalSign = VitalSensor(
        dateTime: DateTime.parse(data['dateTime']),
        heartRate: data['heart_rate'],
        // bloodPressure: data['blood_pressure'],
        // {
        //   'systolic': data['blood_pressure']['systolic'],
        //   'diastolic': data['blood_pressure']['diastolic'],
        // },
        respiratoryRate: data['respiratory_rate'],
        oxygenSaturation: data['oxygen_saturation'],
      );

      vitalSigns.add(vitalSign);
    });

    return vitalSigns;
  }

  create() async {
    isLoading.value = true;

    user = FirebaseAuth.instance.currentUser;
    String userId = getCurrentUserId();
    vitalSensorData.value = await retrieveVitalSignData(userId);

    isLoading.value = false;
  }
}
