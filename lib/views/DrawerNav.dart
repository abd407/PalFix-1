import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class DrawerNave extends StatelessWidget {
  const DrawerNave({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        alignment: Alignment.topRight,
        color: Color.fromARGB(121, 224, 255, 252),
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: [
            UserAccountsDrawerHeader(
              margin: const EdgeInsets.only(bottom: 0),
              decoration:
          
                  BoxDecoration(color: Colors.teal, shape: BoxShape.rectangle),
              accountName: const Text('PALFIX'),
              accountEmail: const Text('Repair Your Home'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset('assets/Imgaes/PalfixLogo.jpg'),
                ),
              ),
            ),

            Container(
                child: ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                height: 100,
                color: Colors.teal,
              ),
            )),
            const ListTile(
              //leading: Icon(Icons.contactless_rounded),
              title: Text('تـــواصل معنــــا'),
            ),
            const ListTile(
              leading: Icon(Icons.web),
              title: Text('www.palfix.ps'),
            ),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text(' Help@palfix.ps'),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text(' 0592151171'),
            ),
          
            
          ],
        ),
      ),
    ));
  }
}
