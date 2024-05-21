import 'dart:math';
import 'dart:developer';

class Appointment {
  final DateTime Appointment_datetime;
  final String Appointment_name;
  final String Appointment_adress;
  final String Appointment_notes;
  final int Appointment_phone;
  final int service_id;
  final int status;

  Appointment({
    required this.Appointment_datetime,
    required this.Appointment_name,
    required this.Appointment_adress,
    required this.Appointment_notes,
    required this.Appointment_phone,
    required this.service_id,
    required this.status,
  });

  factory Appointment.fromJson(dynamic json) {
    // --------------- get the key which is the id of the object ----------//
    String id = json.keys.toList()[0];
    //print('whatever you want to print ${id}');
    return Appointment(
      Appointment_datetime: json[id]['Appointment_datetime'] as DateTime,
      Appointment_name: json[id]['Appointment_name'] as String,
      Appointment_adress: json[id]['Appointment_adress'] as String,
      Appointment_notes: json[id]['Appointment_notes'] as String,
      Appointment_phone: json[id]['Appointment_phone'] as int,
      service_id: json[id]['service_id'] as int,
      status: json[id]['status'] as int,
    );
  }

  static List<Appointment> servicesFromSnapShot(List snapshot) {
    return snapshot.map((data) {
      return Appointment.fromJson(data);
    }).toList();
  }
}
