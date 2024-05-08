import 'package:andallah/user_Dashbord.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

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

  //------------------------------------------------------------------------------------//
  //----------------------- WhatsUp and Phone Configuration ----------------------------//
  //------------------------------------------------------------------------------------//
  final Uri phoneNumber = Uri.parse('tel:+970-569-494-224');
  final Uri whatsapp = Uri.parse('https://wa.me/970569494224');

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

                  /// -------------- Name Row Is Here -------------------////
                  Container(
                    margin: const EdgeInsets.only(right: 30, left: 30),
                    child: const TextField(
                      autofocus: true,
                      cursorColor: Colors.black,
                      maxLength: 20,
                      style: TextStyle(color: Color.fromARGB(255, 43, 43, 43)),
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
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 35, 36, 36)),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.teal),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 2, 94, 85)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 234, 238, 237)),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 254, 255),
                      ),
                    ),
                  ),

                  ///----------------------- Phone Adress -------------------//
                  Container(
                    margin: const EdgeInsets.only(right: 30, left: 30),
                    child: const TextField(
                      cursorColor: Colors.black,
                      maxLength: 20,
                      style: TextStyle(color: Color.fromARGB(255, 43, 43, 43)),
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
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 35, 36, 36)),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.teal),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 2, 94, 85)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 234, 238, 237)),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 254, 255),
                      ),
                    ),
                  ),

                  ///----------------------- Damage Discription -------------------//
                  Container(
                    margin: const EdgeInsets.only(right: 30, left: 30),
                    child: const TextField(
                      cursorColor: Colors.black,
                      maxLength: 20,
                      style: TextStyle(color: Color.fromARGB(255, 43, 43, 43)),
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
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 35, 36, 36)),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.teal),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 2, 94, 85)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 234, 238, 237)),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 254, 255),
                      ),
                    ),
                  )

                  ///----------------------- Phone Adress -------------------//
                  // const Row(
                  //   children: [
                  //     Text('وصف العطل'),
                  //     TextField(
                  //       decoration: InputDecoration(
                  //         border: OutlineInputBorder(),
                  //         hintText: 'اكتب وصف العطل',
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              )),
        ));

   
  }
}
