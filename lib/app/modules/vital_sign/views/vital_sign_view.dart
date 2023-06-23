import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/vital_sensor_model.dart';
import '../../../utils/style.dart';
import '../controllers/vital_sign_controller.dart';

class VitalSignView extends GetView<VitalSignController> {
  InkWell _hospitalBtn() {
    return InkWell(
      child: Column(
        children: [
          Container(
              // margin: EdgeInsets.all(100.0),
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  color: Colors.grey[100], shape: BoxShape.circle),
              child: Icon(
                Icons.local_hospital_rounded,
                color: Colors.blue,
              )),
          SizedBox(
            height: 8,
          ),
          Text('Hospital'),
        ],
      ),
    );
  }

  InkWell _medicineBtn() {
    return InkWell(
      child: Column(
        children: [
          Container(
              // margin: EdgeInsets.all(100.0),
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  color: Colors.grey[100], shape: BoxShape.circle),
              child: Icon(
                Icons.medical_services,
                color: Colors.blue,
              )),
          SizedBox(
            height: 8,
          ),
          Text('Medicine'),
        ],
      ),
    );
  }

  InkWell _doctorBtn() {
    return InkWell(
      child: Column(
        children: [
          Container(
              // margin: EdgeInsets.all(100.0),
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  color: Colors.grey[100], shape: BoxShape.circle),
              child: Icon(
                Icons.person,
                color: Colors.blue,
              )),
          SizedBox(
            height: 8,
          ),
          Text('Doctor'),
        ],
      ),
    );
  }

  InkWell _diagnosisBtn() {
    return InkWell(
      child: Column(
        children: [
          Container(
              // margin: EdgeInsets.all(100.0),
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  color: Colors.grey[100], shape: BoxShape.circle),
              child: Icon(
                Icons.medical_information,
                color: Colors.blue,
              )),
          SizedBox(
            height: 8,
          ),
          Text('Diagnosis'),
        ],
      ),
    );
  }

  _iconShortcut() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _diagnosisBtn(),
        _doctorBtn(),
        _medicineBtn(),
        _hospitalBtn(),
      ],
    );
  }

  _oxyChart(height) {
    return Obx(() => Container(
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              border: Border.all(color: secondaryColor),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.getAverageOxygenSaturation()}%",
                        style: primaryTextStyle.copyWith(
                            fontSize: titleFs, fontWeight: semiBold),
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 224, 250, 254),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            'normal',
                            style:
                                primaryTextStyle.copyWith(fontWeight: semiBold),
                          ))
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 224, 250, 254),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.water_drop,
                          size: 50, color: Color.fromARGB(255, 94, 142, 147))),
                  Text(
                    'Oxygen\nSaturation',
                    style: primaryTextStyle.copyWith(
                        fontSize: titleFs, fontWeight: semiBold),
                  ),
                ],
              ),
              Container(
                height: height,
                child: SfCartesianChart(
                  // title: ChartTitle(text: 'Oxygen Saturation / Minute'),
                  plotAreaBorderWidth: 0,
                  primaryXAxis: DateTimeAxis(
                    isVisible: false,
                  ),
                  primaryYAxis: NumericAxis(
                    isVisible: false, // Hide the Y-axis labels
                  ),
                  tooltipBehavior: TooltipBehavior(),
                  zoomPanBehavior: ZoomPanBehavior(
                    enablePinching: true,
                    enableDoubleTapZooming: true,
                    enablePanning: true,
                    enableSelectionZooming: true,
                    enableMouseWheelZooming: true,
                  ),
                  series: <SplineAreaSeries<VitalSensor, DateTime>>[
                    SplineAreaSeries<VitalSensor, DateTime>(
                        dataSource: controller.vitalSensorData,
                        xValueMapper: (VitalSensor hrData, _) =>
                            hrData.dateTime,
                        yValueMapper: (VitalSensor hrData, _) =>
                            hrData.oxygenSaturation,
                        // name: 'Oxygen Saturation',
                        color: Color.fromARGB(255, 224, 250, 254),
                        markerSettings: MarkerSettings(
                            // color: const Color.fromARGB(106, 33, 149, 243),
                            width: 3,
                            height: 3,
                            isVisible: true),
                        enableTooltip: true,
                        borderWidth: 3,
                        borderColor: Color.fromARGB(255, 94, 142, 147))
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  _bpmChart(height) {
    return Obx(() => Container(
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              border: Border.all(color: secondaryColor),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.getAverageHeartRate()} bpm",
                        style: primaryTextStyle.copyWith(
                            fontSize: titleFs, fontWeight: semiBold),
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 224, 250, 254),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            'normal',
                            style:
                                primaryTextStyle.copyWith(fontWeight: semiBold),
                          ))
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 240, 230, 230),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.monitor_heart_rounded,
                          size: 50, color: Color.fromARGB(255, 184, 100, 100))),
                  Text(
                    'Heart Rate',
                    style: primaryTextStyle.copyWith(fontSize: titleFs),
                  ),
                ],
              ),
              Container(
                // margin: EdgeInsets.only(top: -5),
                height: height,
                child: SfCartesianChart(
                  // title: ChartTitle(text: 'Heart Rate / Minute'),
                  plotAreaBorderWidth: 0,
                  primaryXAxis: DateTimeAxis(
                    isVisible: false,
                  ),
                  primaryYAxis: NumericAxis(
                    isVisible: false, // Hide the Y-axis labels
                  ),
                  tooltipBehavior: TooltipBehavior(),
                  zoomPanBehavior: ZoomPanBehavior(
                    enablePinching: true,
                    enableDoubleTapZooming: true,
                    enablePanning: true,
                    enableSelectionZooming: true,
                    enableMouseWheelZooming: true,
                  ),
                  series: <SplineAreaSeries<VitalSensor, DateTime>>[
                    SplineAreaSeries<VitalSensor, DateTime>(
                        dataSource: controller.vitalSensorData,
                        xValueMapper: (VitalSensor hrData, _) =>
                            hrData.dateTime,
                        yValueMapper: (VitalSensor hrData, _) =>
                            hrData.heartRate,
                        name: 'Heart Rate',
                        color: Color.fromARGB(255, 240, 230, 230),
                        markerSettings: MarkerSettings(
                            // color: const Color.fromARGB(106, 33, 149, 243),
                            width: 3,
                            height: 3,
                            isVisible: true),
                        enableTooltip: true,
                        borderWidth: 3,
                        borderColor: Color.fromARGB(255, 243, 86, 33)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.15;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        // title: Text(controller.heartRateData![0].value!.bpm.toString()),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() => (controller.isLoading.value == true) ? Center(child: CircularProgressIndicator(),) : Container(
            color: backgroundColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hi Patient!", style: titleTextStyle),
                    Icon(Icons.person)
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                _bpmChart(height),
                const SizedBox(
                  height: 16,
                ),
                _oxyChart(height),
                const SizedBox(
                  height: 16,
                ),
                _iconShortcut(),
              ],
            ),
          )),
    );
  }
}
