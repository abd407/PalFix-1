import 'package:andallah/user_Dashbord.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
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

  //------------------------------------------------------------------------------------//
  //----------------------- WhatsUp and Phone Configuration ----------------------------//
  //------------------------------------------------------------------------------------//

  @override
  _MyImageScreen createState() => _MyImageScreen(url, title);
}

// ignore: unused_element
class _MyImageScreen extends State<ImageScreen> {
  final String url;
  final String title;

  _MyImageScreen(this.url, this.title);

  final Uri phoneNumber = Uri.parse('tel:+970-569-494-224');
  final Uri whatsapp = Uri.parse('https://wa.me/970569494224');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
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
        body: Image.asset(url, width: double.infinity));
  }
}
