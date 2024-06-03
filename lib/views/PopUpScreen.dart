import 'dart:ffi';

import 'package:palfix/services/ApiController.dart';
import 'package:palfix/views/DrawerNav.dart';
import 'package:palfix/views/user_Dashbord.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ImageScreen extends StatefulWidget {
  final String url;
  final String title;
  final String servic_id;

  const ImageScreen(this.url, this.title, this.servic_id, {super.key});

  pushToHome(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const UserDashbord()),
    );
  }

  @override
  _MyImageScreen createState() => _MyImageScreen(url, title, servic_id);
}

// ignore: unused_element
class _MyImageScreen extends State<ImageScreen> {
  final String url;
  final String title;
  final String servic_id;

  String name = "";
  var nameIsNotEmpty = false;
  String phone = "";
  var phoneIsNotEmpty = false;
  String address = "";
  var addressIsNotEmpty = false;
  String date = "";
  var dateIsNotEmpty = false;
  String problem = "";
  var problemIsNotEmpty = false;

  var isValediate = false;
  String ValidationString = "";
  _MyImageScreen(this.url, this.title, this.servic_id);

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }


//-------------------------------------------------------------------------------//
//----------------------- Navigate to Home Screen -------------------------------//
//-------------------------------------------------------------------------------//

  pushToHome(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const UserDashbord()),
    );
  }
  //------------------------------------------------------------------------------------//
  //------------------------------- Valediate Function ---------------------------------//
  //------------------------------------------------------------------------------------//
  String validate() {
    Future<String> respo;
    String result = "";

    if (name == "") {
      result += " الاسم ";
    }

    if (problem == "") {
      result += " العطل  ";
    }

    if (date == "" && !dateIsNotEmpty) {
      result += " الموعد   ";
    }

    if (address == "") {
      result += " العنوان   ";
    }

    if (phone == "" && phone.length != 10) {
      result += " رقم الهاتف خاطئ ";
    }

    if (result != "") {
      result = "الرجاء ادخال البيانات التالية $result";
      setState(() {
        ValidationString = result;
        isValediate = true;
      });
    } else {
      // setthe status of the page
      // semt the data to the server
      // show dialog to get the returened message
      // return to main page
      setState(() {
        ValidationString = result;
        isValediate = false;
        ApiController.postAppointment(
            name, phone, date, address, problem, servic_id, showDialogResult);
      });
      
    }

    return result;
  }

  //----------------------------------------------------------------------------------//
  //----------------- Open Dialog to Insure that the Appoitment is send --------------//
  //----------------------------------------------------------------------------------//

  showDialogResult(String result) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('عملية الحجز '),
          content: Text(result),
          actions: [
            TextButton(
                onPressed: () => pushToHome(context),
                child: const Text("حسنا"))
          ],
        ),

        
      );




    
  //------------------------------------------------------------------------------------//
  //----------------------- WhatsUp and Phone Configuration ----------------------------//
  //------------------------------------------------------------------------------------//
  final Uri phoneNumber = Uri.parse('tel:+970-569-494-224');
  final Uri whatsapp = Uri.parse('https://wa.me/970569494224');

  //------------------------------------------------------------------------------------//
  //----------------------- scroller and dattime Configuration -------------------------//
  //------------------------------------------------------------------------------------//
  final ScrollController _controller = ScrollController();
  TextEditingController dateInput = TextEditingController();

  //------------------------------------------------------------------------------------//
  //-------------------------------- Build Functio  ------------------------------------//
  //------------------------------------------------------------------------------------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const DrawerNave(),
        appBar: AppBar(
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.teal,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: ClipPath(
          clipper: PannerClipper(),
          child: Container(
              color: const Color.fromARGB(122, 199, 249, 244),
              child: Column(
                children: [
                  Image.network(url,
                      width: MediaQuery.of(context).size.width * .3),
                  Container(
                      height: 400,
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(), // new
                        controller: _controller,
                        scrollDirection: Axis.vertical,
                        children: [
                          /// -------------- Name Row Is Here -------------------////
                          Container(
                            height: 75,
                            margin: const EdgeInsets.only(right: 30, left: 30),
                            child: TextField(
                              onChanged: (val) {
                                setState(() {
                                  name = val;
                                  nameIsNotEmpty = name == "" ? false : true;
                                });
                              },
                              autofocus: true,
                              cursorColor: Colors.black,
                              maxLength: 20,
                              style: const TextStyle(
                                  color: Color.fromRGBO(43, 43, 43, 1)),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color:
                                      nameIsNotEmpty ? Colors.teal : Colors.red,
                                ),
                                hintText: 'أكتب اسمك هنا',
                                hintStyle: const TextStyle(
                                    color: Color(0xFFB3B1B1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                                contentPadding: const EdgeInsets.all(20),
                                isDense: true,
                                labelText: 'الاسم',
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 35, 36, 36)),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 2, 94, 85)),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 234, 238, 237)),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 255, 254, 255),
                              ),
                            ),
                          ),

                          ///----------------------- Phone Adress -------------------//
                          Container(
                            height: 75,
                            margin: const EdgeInsets.only(right: 30, left: 30),
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              onChanged: (val) {
                                setState(() {
                                  phone = val;
                                  phoneIsNotEmpty =
                                      phone.length != 10 ? false : true;
                                });
                              },
                              cursorColor: Colors.black,
                              maxLength: 20,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 43, 43, 43)),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: phoneIsNotEmpty
                                      ? Colors.teal
                                      : Colors.red,
                                ),
                                hintText: '05xxxxxxxx',
                                hintStyle: const TextStyle(
                                    color: Color(0xFFB3B1B1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                                contentPadding: const EdgeInsets.all(20),
                                isDense: true,
                                labelText: 'الهاتف',
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 35, 36, 36)),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 2, 94, 85)),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 234, 238, 237)),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 255, 254, 255),
                              ),
                            ),
                          ),

                          ///----------------------- Damage Adress -------------------//
                          Container(
                            height: 75,
                            margin: const EdgeInsets.only(right: 30, left: 30),
                            child: TextField(
                              onChanged: (val) {
                                setState(() {
                                  address = val;
                                  addressIsNotEmpty = val == "" ? false : true;
                                });
                              },
                              cursorColor: Colors.black,
                              maxLength: 20,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 43, 43, 43)),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.home,
                                  color: addressIsNotEmpty
                                      ? Colors.teal
                                      : Colors.red,
                                ),
                                hintText: 'أكتب عنوانك هنا',
                                hintStyle: const TextStyle(
                                    color: Color(0xFFB3B1B1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                                contentPadding: const EdgeInsets.all(20),
                                isDense: true,
                                labelText: 'العنوان',
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 35, 36, 36)),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 2, 94, 85)),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 234, 238, 237)),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 255, 254, 255),
                              ),
                            ),
                          ),
                          //----------------------------------------------------------//
                          ///----------------------- Damage Adress -------------------//
                          ///---------------------------------------------------------
                          Container(
                            height: 150,
                            margin: const EdgeInsets.only(right: 30, left: 30),
                            child: TextField(
                              onChanged: (val) {
                                setState(() {
                                  problem = val;
                                  problemIsNotEmpty =
                                      problem == "" ? false : true;
                                });
                              },
                              cursorColor: Colors.black,
                              maxLength: 20,
                              maxLines: 5,
                              minLines: 5,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 43, 43, 43)),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.error,
                                  color: problemIsNotEmpty
                                      ? Colors.teal
                                      : Colors.red,
                                ),
                                hintText: 'العطل',
                                hintStyle: const TextStyle(
                                    color: Color(0xFFB3B1B1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                                contentPadding: const EdgeInsets.all(20),
                                isDense: true,
                                labelText: 'اكتب وصف العطل',
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 35, 36, 36)),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 2, 94, 85)),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 234, 238, 237)),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 255, 254, 255),
                              ),
                            ),
                          ),
                          //--------------------------------------------------------------------//
                          //--------------------------------- Date Picker ----------------------//
                          //--------------------------------------------------------------------//
                          Container(
                              height: 60,
                              margin:
                                  const EdgeInsets.only(right: 30, left: 30),
                              child: TextField(
                                onChanged: (val) {
                                  setState(() {
                                    date = val;
                                  });
                                },
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 43, 43, 43)),
                                controller: dateInput,
                                //editing controller of this TextField
                                decoration: InputDecoration(
                                  hintStyle: const TextStyle(
                                      color: Color(0xFFB3B1B1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                  contentPadding: const EdgeInsets.all(20),
                                  isDense: true,

                                  prefixIcon: Icon(
                                    Icons.calendar_view_day_rounded,
                                    color: addressIsNotEmpty
                                        ? Colors.teal
                                        : Colors.red,
                                  ), //icon of text field
                                  labelText: "تاريخ الحجز" //label text of field
                                  ,
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Color.fromARGB(255, 2, 94, 85)),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 234, 238, 237)),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 255, 254, 255),
                                ),
                                readOnly: true,
                                //set it true, so that user will not able to edit text
                                onTap: () async {
                                  await pickDateTime();
                                },
                              )),

                          //--------------------------------------------------------------------//
                          //------------------------ Valedation Message ------------------------//
                          //--------------------------------------------------------------------//
                          Visibility(
                            visible: isValediate,
                            child: Container(
                                height: 50,
                                margin:
                                    const EdgeInsets.only(right: 30, left: 30),
                                child: Text(
                                  ValidationString,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w200),
                                )),
                          ),
                          //-----------------------------------------------------------------------//
                          //------------------------------- pock Button ---------------------------//
                          //-----------------------------------------------------------------------//
                          Container(
                            width: 60,
                            margin:
                                const EdgeInsets.only(
                                right: 30, left: 30, top: 20),
                            height: 80,
                            child: ElevatedButton(
                              //style:ButtonStyle()
                              onPressed: () {
                                validate();
                              },
                              child: const Text('أحجز موعدا الآن'),
                            ),
                          ),
                        ],
                      ))
                ],
              )),
        ));
  }

  //------------------------------------------------------------------------------//
  ///----------------------------- Show Calender and Clock -----------------------//
  ///-----------------------------------------------------------------------------//
  Future pickDateTime() async {
    DateTime? chosenDate = await pickDate();

    //-------------------- if No Date where chosen ---------------------------------//
    if (chosenDate == null) {
      setState(() {
        dateIsNotEmpty = false;
      });
      return;
    }

    //----------------------- if  Date where chosen ---------------------------------//

    //pickedDate output format => 2021-03-10 00:00:00.000
    String formattedDate = DateFormat('yyyy-MM-dd').format(chosenDate);
    //formatted date output using intl package =>  2021-03-16
    setState(() {
      dateInput.text = formattedDate;
      date = formattedDate;
      dateIsNotEmpty = true; //set output date to TextField value.
    });

    //----------------------- if  Time not where chosen ------------------------------//
    TimeOfDay? time = await pickTime();
    if (time == null) {
      setState(() {
        dateIsNotEmpty = false;
      });
      return;
    }

    //----------------------- if  Time not where chosen ------------------------------//

    //pickedDate output format => 2021-03-10 00:00:00.000
    String hour = time.hour.toString();
    String minuts = time.minute.toString();

    //formatted date output using intl package =>  2021-03-16
    setState(() {
      dateInput.text = "$date:$hour:$minuts";
      date = "$date $hour:$minuts:00";
      dateIsNotEmpty = true;
      dateInput.text = date;
      //set output date to TextField value.
    });

   
  }

  //------------------------------------------------------------------------------//
  ///----------------------------- get Date from Calender  -----------------------//
  ///-----------------------------------------------------------------------------//

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2));

  //-----------------------------------------------------------------------------//
  ///----------------------------- get Time from Clock - -------------------------//
  ///-----------------------------------------------------------------------------//
  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      
      initialTime:
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute));
}
