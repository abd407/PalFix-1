import 'package:flutter/material.dart';
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
        color: Color.fromARGB(255, 223, 246, 244),
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: [

            Container(
                child: ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                height: 220,
                padding: EdgeInsets.only(top: 60),
                color: Colors.teal,
                child: Center(
                    child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/Imgaes/PalfixLogo.jpg',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    const Text(
                      'PALFIX',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Repair Your Home',
                      style: TextStyle(
                        
                          fontSize: 11,
                          color: Color.fromARGB(255, 248, 255, 255),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                )),
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
