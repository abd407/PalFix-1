import 'dart:math';
import 'dart:developer';

class WebSitContacts {
  final String Company_Addres_ar;
  final String Company_Addres_an;
  final String Email;
  final String Facebook;
  final String Google;
  final String Insta;
  final String LinkedIn;
  final String Phone;
  final String Snapshat;
  final String Whatsup;

  WebSitContacts({
    required this.Email,
    required this.Phone,
    required this.Whatsup,
    this.Company_Addres_ar = "",
    this.Company_Addres_an = "",
    this.Facebook = "",
    this.Google = "",
    this.Insta = "",
    this.LinkedIn = "",
    this.Snapshat = "",
  });

  factory WebSitContacts.fromJson(dynamic json) {
    // --------------- get the key which is the id of the object ----------//
    String id = json.keys.toList()[0];
    //print('whatever you want to print ${id}');
    return WebSitContacts(
      Email: json['Email'] as String,
      Phone: json['Phone'] as String,
      Whatsup: json['Whatsup'] as String,
      Company_Addres_ar: json['Company_Addres_ar'] as String,
      Company_Addres_an: json['Company_Addres_an'] as String,
      Facebook: json['Facebook'] as String,
      Google: json['Google'] as String,
      Insta: json['Insta'] as String,
      LinkedIn: json['LinkedIn'] as String,
    );
  }

  static List<WebSitContacts> servicesFromSnapShot(List snapshot) {
    return snapshot.map((data) {
      return WebSitContacts.fromJson(data);
    }).toList();
  }
}
