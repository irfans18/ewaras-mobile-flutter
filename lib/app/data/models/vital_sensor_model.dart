class VitalSensor {
  DateTime? dateTime;
  int? heartRate;
  BloodPressure? bloodPressure;
  int? respiratoryRate;
  int? oxygenSaturation;

  VitalSensor(
      {this.dateTime,
      this.heartRate,
      this.bloodPressure,
      this.respiratoryRate,
      this.oxygenSaturation});

  VitalSensor.fromJson(Map<String, dynamic> json) {
    dateTime = DateTime.parse(json['dateTime']);
    heartRate = json['heart_rate'];
    bloodPressure = json['blood_pressure'] != null
        ? new BloodPressure.fromJson(json['blood_pressure'])
        : null;
    respiratoryRate = json['respiratory_rate'];
    oxygenSaturation = json['oxygen_saturation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateTime'] = this.dateTime;
    data['heart_rate'] = this.heartRate;
    if (this.bloodPressure != null) {
      data['blood_pressure'] = this.bloodPressure!.toJson();
    }
    data['respiratory_rate'] = this.respiratoryRate;
    data['oxygen_saturation'] = this.oxygenSaturation;
    return data;
  }
}

class BloodPressure {
  int? systolic;
  int? diastolic;

  BloodPressure({this.systolic, this.diastolic});

  BloodPressure.fromJson(Map<String, dynamic> json) {
    systolic = json['systolic'];
    diastolic = json['diastolic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['systolic'] = this.systolic;
    data['diastolic'] = this.diastolic;
    return data;
  }
}
