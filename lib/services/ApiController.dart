import 'dart:convert' as convert;
import 'package:palfix/models/Services.dart';
import 'package:palfix/models/WebSitContacts.dart';
import 'package:palfix/models/WebSitSlider.dart';
import 'package:http/http.dart' as http;

class ApiController {
//-------------------------------------------------------------------//
//-------------------------- Get Services List ----------------------//
//------------------------------ From API ---------------------------//
//-------------------------------------------------------------------//
  static Future<List<Services>?> getServices() async {
    var client = http.Client();

    var uri = Uri.parse("https://palfix.ps/api/Home/get_Services");

    //var url =
    // Uri.https('palfix.ps', '/api/Home/get_Services', {'q': '{http}'});
    List<Services> _temp = [];
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      Map data = convert.jsonDecode(response.body) as Map<String, dynamic>;

      //-------------------- we need to see the data ---------------//
      //------------------- toknow how to read it correctly --------//

      return Services.servicesFromSnapShot(data["result"]);
    } else {
      
      return Services.servicesFromSnapShot(_temp);
    }
  }

// https://palfix.ps/api/Home/get_Website_slider

//----------------------------------------------------------------//
//---------------- Slides Section Api Connect --------------------//
//----------------------------------------------------------------//
  static Future<List<SlideShowData>?> getSlidesContent() async {
    var client = http.Client();

    var uri = Uri.parse("https://palfix.ps/api/Home/get_Website_slider");

    //var url =
    // Uri.https('palfix.ps', '/api/Home/get_Services', {'q': '{http}'});
    List<SlideShowData> _temp = [];
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      Map data = convert.jsonDecode(response.body) as Map<String, dynamic>;

      //-------------------- we need to see the data ---------------//
      //------------------- toknow how to read it correctly --------//

      return SlideShowData.SlidesFromSnapShot(data["result"]);
    } else {
      ;
      return SlideShowData.SlidesFromSnapShot(_temp);
    }
  }

//----------------------------------------------------------------//
//--------------------- Get Web Sit Contacts List ----------------//
//-------------------------- From API ----------------------------//
//----------------------------------------------------------------//
  static Future<List<WebSitContacts>> getWebSitInfo() async {
    var client = http.Client();

    var uri = Uri.parse("https://palfix.ps/api/Home/get_Services");

    //var url =
    // Uri.https('palfix.ps', '/api/Home/get_Services', {'q': '{http}'});
    List _temp = [];
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      Map data = convert.jsonDecode(response.body) as Map<String, dynamic>;
      //Map data = json.decode(response.body);
      
      //-------------------- we need to see the data -------------//
      //------------------- toknow how to read it correctly -------//
      

      return WebSitContacts.servicesFromSnapShot(_temp);
    } else {
      
      return WebSitContacts.servicesFromSnapShot(_temp);
    }
  }


//----------------------------------------------------------------//
//----------------------- pok a new appointment  -----------------//
//-------------------------- From API ----------------------------//
//----------------------------------------------------------------//

  static Future postAppointment(
    String name,
    String phone,
    String date,
    String address,
    String notes,
    String id_service,
      Function dialogShower
  ) async {
    var client = http.Client();

    var uri = Uri.parse("https://palfix.ps/api/Home/insert_appointment");

    var result = "";
    
    final response = await client
        .post(uri, body: {
          "appointment_name": name,
          "appointment_tel": phone,
          "appointment_address": address,
          "appointment_notes": notes,
          "appointment_date": date,
          "services_id": id_service,
        })
        .then((value) => value.statusCode >= 200 && value.statusCode <= 299
            ? dialogShower("تم ارسال الطلب بنجاح ")
            : dialogShower(
                "حدث خطأ اثناء ارسال الطلب الرجاء التاكد من خدمة الانترنت و ارساله بوقت لاحق"))
                
        .onError((error, stackTrace) => dialogShower(
            "حدث خطأ أثناء المعالجة كما يلي : \n\n" + error.toString()));

    
  }
}
