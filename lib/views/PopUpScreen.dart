import 'dart:ffi';

import 'package:andallah/services/ApiController.dart';
import 'package:andallah/views/user_Dashbord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class ImageScreen extends StatefulWidget {
  final String url;
  final String title;
  final String servic_id;

  const ImageScreen(this.url, this.title, this.servic_id);

  pushToHome(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => UserDashbord()),
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


  //------------------------------------------------------------------------------------//
  //------------------------------- Valediate Function ---------------------------------//
  //------------------------------------------------------------------------------------//
  String Validate() {
    String result = "";

    if (name == "") {
      result += " الاسم ";
    }

    if (problem == "") {
      result += " المشكلة  ";
    }

    if (date == "") {
      result += " الموعد   ";
    }

    if (address == "") {
      result += " العنوان   ";
    }

    if (phone == "") {
      result += " رقم الهاتف   ";
    }
 

    if (result != "") {
      result = "الرجاء ادخال البيانات التالية $result";
      setState(() {
        ValidationString = result;
        isValediate = true;
      });
    } else {
      setState(() {
        ValidationString = result;
        isValediate = false;
        //ApiController.postAppointment(
        //  name, phone, date, address, problem, servic_id);
        print("$name\n$phone\n$date\n$address\n$problem\n$servic_id");
      });
    }
    return result;
  }

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
                                  borderSide:
                                      BorderSide(color: Colors.teal),
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
                                fillColor: Color.fromARGB(255, 255, 254, 255),
                              ),
                            ),
                          ),

                          ///----------------------- Phone Adress -------------------//
                          Container(
                            height: 75,
                            margin: const EdgeInsets.only(right: 30, left: 30),
                            child: TextField(
                              onChanged: (val) {
                                setState(() {
                                  phone = val;
                                  phoneIsNotEmpty = phone == "" ? false : true;
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
                                hintText: '05x xxx xxxx',
                                hintStyle: const TextStyle(
                                    color: Color(0xFFB3B1B1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                                contentPadding: EdgeInsets.all(20),
                                isDense: true,
                                labelText: 'الهاتف',
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 35, 36, 36)),
                                border: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.teal),
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
                                fillColor: Color.fromARGB(255, 255, 254, 255),
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
                                contentPadding: EdgeInsets.all(20),
                                isDense: true,
                                labelText: 'العنوان',
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 35, 36, 36)),
                                border: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.teal),
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
                                fillColor: Color.fromARGB(255, 255, 254, 255),
                              ),
                            ),
                          ),
                          //----------------------------------------------------------//
                          ///----------------------- Damage Adress -------------------//
                          ///---------------------------------------------------------
                          Container(
                            height: 150,
                            margin: EdgeInsets.only(right: 30, left: 30),
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
                                contentPadding: EdgeInsets.all(20),
                                isDense: true,
                                labelText: 'اكتب وصف العطل',
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 35, 36, 36)),
                                border: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.teal),
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
                                fillColor: Color.fromARGB(255, 255, 254, 255),
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
                                    dateIsNotEmpty = date == "" ? false : true;
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
                                  contentPadding: EdgeInsets.all(20),
                                  isDense: true,

                                  prefixIcon: Icon(
                                      Icons.calendar_view_day_rounded,
                                    color: addressIsNotEmpty
                                        ? Colors.teal
                                        : Colors.red,
                                  ), //icon of text field
                                    labelText:
                                        "تاريخ الحجز" //label text of field
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
                                  fillColor: Color.fromARGB(255, 255, 254, 255),
                                    ),
                                readOnly: true,
                                //set it true, so that user will not able to edit text
                                onTap: () async {
                                  DateTime? pickedDate = await pickDateTime();

                                },
                              )),

                          //--------------------------------------------------------------------//
                          //------------------------ Valedation Message ------------------------//
                          //--------------------------------------------------------------------//
                          Visibility(
                            visible: isValediate,
                            child: Container(
                                height: 150,
                                margin: EdgeInsets.only(right: 30, left: 30),
                                child: Text(ValidationString)),
                          ),
                          //-----------------------------------------------------------------------//
                          //------------------------------- pock Button ---------------------------//
                          //-----------------------------------------------------------------------//
                          Container(
                            width: 60,
                            margin:
                                EdgeInsets.only(right: 30, left: 30, top: 20),
                            height: 80,
                            child: ElevatedButton(
                              //style:ButtonStyle()
                              onPressed: () {
                                Validate();
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
    if (chosenDate == null) return;

    //----------------------- if  Date where chosen ---------------------------------//

    //pickedDate output format => 2021-03-10 00:00:00.000
    String formattedDate = DateFormat('yyyy-MM-dd').format(chosenDate);
    //formatted date output using intl package =>  2021-03-16
    setState(() {
      dateInput.text = formattedDate;
      date = formattedDate; //set output date to TextField value.
    });

    print(date);
    print(chosenDate);

    //----------------------- if  Time not where chosen ------------------------------//
    TimeOfDay? time = await PickTime();
    if (time == null) return;

    //----------------------- if  Time not where chosen ------------------------------//

    //pickedDate output format => 2021-03-10 00:00:00.000
    String timechosen = time.toString();
    //formatted date output using intl package =>  2021-03-16
    setState(() {
      dateInput.text = timechosen;
      date += ":$timechosen"; //set output date to TextField value.
    });

    print(date);
    print(time);
  }

  //------------------------------------------------------------------------------//
  ///----------------------------- get Date from Calender  -----------------------//
  ///-----------------------------------------------------------------------------//

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2));

  //-----------------------------------------------------------------------------//
  ///----------------------------- get Time from Clock - -------------------------//
  ///-----------------------------------------------------------------------------//
  Future<TimeOfDay?> PickTime() => showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute));
}
