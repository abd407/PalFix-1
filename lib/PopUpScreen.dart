import 'package:andallah/user_Dashbord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class ImageScreen extends StatefulWidget {
  final String url;
  final String title;
  ImageScreen(this.url, this.title);

  pushToHome(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => UserDashbord()),
    );
  }

  @override
  _MyImageScreen createState() => _MyImageScreen(url, title);
}

// ignore: unused_element
class _MyImageScreen extends State<ImageScreen> {
  final String url;
  final String title;

  _MyImageScreen(this.url, this.title);

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  //------------------------------------------------------------------------------------//
  //----------------------- WhatsUp and Phone Configuration ----------------------------//
  //------------------------------------------------------------------------------------//
  final Uri phoneNumber = Uri.parse('tel:+970-569-494-224');
  final Uri whatsapp = Uri.parse('https://wa.me/970569494224');
  ScrollController _controller = new ScrollController();

  TextEditingController dateInput = TextEditingController();
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.teal,
            tooltip: 'whatsapp',
            onPressed: () {},
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.whatsapp),
              color: Colors.white,
              iconSize: 35,
              // --------------------------- Oppining Whatsapp Her -----------------------//
              onPressed: () {
                launchUrl(whatsapp);
              },
            )),
        bottomNavigationBar: BottomAppBar(
          color: Colors.teal,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    //------------------------------ Go to HomePage Her --------------------------//
                    Icons.home,
                    color: Colors.white,
                    size: 35,
                  )),
              IconButton(
                  //----------------------------------- Calling Number Here ---------------------//
                  onPressed: () async {
                    await launchUrl(phoneNumber);
                  },
                  icon: const Icon(
                    Icons.call,
                    color: Colors.white,
                    size: 35,
                  ))
            ],
          ),
        ),
        body: ClipPath(
          clipper: PannerClipper(),
          child: Container(
              color: const Color.fromARGB(122, 199, 249, 244),
              child: Column(
                children: [
                  Image.asset(url,
                      width: MediaQuery.of(context).size.width * .4),
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
                            child: const TextField(
                              autofocus: true,
                              cursorColor: Colors.black,
                              maxLength: 20,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 43, 43, 43)),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.teal,
                                ),
                                hintText: 'أكتب اسمك هنا',
                                hintStyle: TextStyle(
                                    color: Color(0xFFB3B1B1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                                contentPadding: EdgeInsets.all(20),
                                isDense: true,
                                labelText: 'الاسم',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 35, 36, 36)),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.teal),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 2, 94, 85)),
                                ),
                                enabledBorder: OutlineInputBorder(
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
                            child: const TextField(
                              cursorColor: Colors.black,
                              maxLength: 20,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 43, 43, 43)),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.teal,
                                ),
                                hintText: '05x xxx xxxx',
                                hintStyle: TextStyle(
                                    color: Color(0xFFB3B1B1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                                contentPadding: EdgeInsets.all(20),
                                isDense: true,
                                labelText: 'الهاتف',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 35, 36, 36)),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.teal),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 2, 94, 85)),
                                ),
                                enabledBorder: OutlineInputBorder(
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
                            child: const TextField(
                              cursorColor: Colors.black,
                              maxLength: 20,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 43, 43, 43)),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.home,
                                  color: Colors.teal,
                                ),
                                hintText: 'أكتب عنوانك هنا',
                                hintStyle: TextStyle(
                                    color: Color(0xFFB3B1B1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                                contentPadding: EdgeInsets.all(20),
                                isDense: true,
                                labelText: 'العنوان',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 35, 36, 36)),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.teal),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 2, 94, 85)),
                                ),
                                enabledBorder: OutlineInputBorder(
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
                            margin: const EdgeInsets.only(right: 30, left: 30),
                            child: const TextField(
                              cursorColor: Colors.black,
                              maxLength: 20,
                              maxLines: 5,
                              minLines: 5,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 43, 43, 43)),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.error,
                                  color: Colors.teal,
                                ),
                                hintText: 'العطل',
                                hintStyle: TextStyle(
                                    color: Color(0xFFB3B1B1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                                contentPadding: EdgeInsets.all(20),
                                isDense: true,
                                labelText: 'اكتب وصف العطل',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 35, 36, 36)),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.teal),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 2, 94, 85)),
                                ),
                                enabledBorder: OutlineInputBorder(
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
                              height: 150,
                              margin:
                                  const EdgeInsets.only(right: 30, left: 30),
                              child: TextField(
                                controller: dateInput,
                                //editing controller of this TextField
                                decoration: InputDecoration(
                                    icon: Icon(Icons
                                        .calendar_today), //icon of text field
                                    labelText:
                                        "Enter Date" //label text of field
                                    ),
                                readOnly: true,
                                //set it true, so that user will not able to edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2100));

                                  if (pickedDate != null) {
                                    print(
                                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
                                    print(
                                        formattedDate); //formatted date output using intl package =>  2021-03-16
                                    setState(() {
                                      dateInput.text =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  } else {}
                                },
                              )),
                          Container(
                            width: 60,
                            child: ElevatedButton(
                              //style:ButtonStyle()
                              onPressed: () {},
                              child: const Text('أحجز موعدا الآن'),
                            ),
                            height: 70,
                          ),
                        ],
                      ))

                
                ],
              )),
        ));
  }
}
