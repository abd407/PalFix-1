import 'dart:convert' as convert;
import 'package:andallah/models/Services.dart';
import 'package:andallah/models/WebSitContacts.dart';
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
    List _temp = [];
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      Map data = convert.jsonDecode(response.body) as Map<String, dynamic>;

      //-------------------- we need to see the data ---------------//
      //------------------- toknow how to read it correctly --------//

      return Services.servicesFromSnapShot(data["result"]);
    } else {
      print("statusCode 2");
      return Services.servicesFromSnapShot(_temp);
    }
  }

//----------------------------------------------------------------//
//--------------------- Get Web Sit Contacts List ----------------//
//-------------------------- From API ----------------------------//
//----------------------------------------------------------------//
  static Future<List<WebSitContacts>> getWebSitInfo() async {
    var url =
        Uri.https('palfix.ps', '/api/Home/get_Services"s', {'q': '{http}'});
    List _temp = [];
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map data = convert.jsonDecode(response.body) as Map<String, dynamic>;
      //Map data = json.decode(response.body);
      print(response);
      //-------------------- we need to see the data -------------//
      //------------------- toknow how to read it correctly -------//
      print(data);

      return WebSitContacts.servicesFromSnapShot(_temp);
    } else {
      print(_temp);
      return WebSitContacts.servicesFromSnapShot(_temp);
    }
  }
}
