import 'package:flutter/material.dart';

class DrawerNave extends StatelessWidget {
  const DrawerNave({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        alignment: Alignment.topRight,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
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
            )
          ],
        ),
      ),
    ));
  }
}
