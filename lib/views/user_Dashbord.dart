import 'dart:ui';

import 'package:andallah/views/DrawerNav.dart';
import 'package:andallah/views/PopUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDashbord extends StatefulWidget {
  const UserDashbord({Key? key}) : super(key: key);

  @override
  _UserDashbordState createState() => _UserDashbordState();
}

class _UserDashbordState extends State<UserDashbord> {

//--------------------------------------------------------------------------------------//
//------------------------------- Navigation Part --------------------------------------//
//--------------------------------------------------------------------------------------//

  // pushToScreen(BuildContext context) {
  //   Navigator.of(context).push(
  //       //MaterialPageRoute(builder: (_) => PopUpScreen()),
  //       );
  // }

  //-----------------------------------------------------------------------------------//
  //----------------------------- Ads Images List -------------------------------------//
  //-----------------------------------------------------------------------------------//
  List imageList = [
    {"id": 1, 'image_path': 'https://www.palfix.ps/content/3.png'},
    {"id": 2, 'image_path': 'https://www.palfix.ps/content/4.png'},
    {"id": 3, 'image_path': 'https://www.palfix.ps/content/5.png'},
    {"id": 4, 'image_path': 'https://www.palfix.ps/content/6.png'}
  ];


  //------------------------------------------------------------------------------------//
  //----------------------------- Work Images List -------------------------------------//
  //------------------------------------------------------------------------------------//

  List workimageList = [
    {
      "id": 1,
      'image_path': 'assets/Imgaes/1.webp',
      'Title': 'تنظيف الخزانات ',
      "SubTitle": "تنظيف وتعقبم الخزانات و الابار"
    },
    {
      "id": 2,
      'image_path': 'assets/Imgaes/2.webp',
      'Title': 'حرفي',
      "SubTitle": "كل ما بلزم البيت من الاعمال الحرفية  "
    },
    {
      "id": 3,
      'image_path': 'assets/Imgaes/3.webp',
      'Title': 'التكييف',
      "SubTitle": " صيانة و نركيب جميع انواع المكيقات"
    },
    {
      "id": 5,
      'image_path': 'assets/Imgaes/5.webp',
      'Title': 'الدهان و الديكور ',
      "SubTitle": " أحدث و أرقى الديكورات و الدهان"
    },
    {
      "id": 6,
      'image_path': 'assets/Imgaes/6.webp',
      'Title': 'الحدائق والزراعة',
      "SubTitle": " ترتيب وتنسيق الحدائق والورود"
    },
    {
      "id": 7,
      'image_path': 'assets/Imgaes/7.webp',
      'Title': 'شبكات الانترنت',
      "SubTitle": " حلول تقنية لشبكات الانترنت والتغطية"
    },
    {
      "id": 8,
      'image_path': 'assets/Imgaes/8.webp',
      'Title': 'العزل والاسطح ',
      "SubTitle": " عزل وحل مشاكل الاسطح والجدران من الرطوبة"
    },
    {
      "id": 9,
      'image_path': 'assets/Imgaes/9.webp',
      'Title': 'مواسرجي',
      "SubTitle": "صيانة كافة اعمال المواسير"
    },
    {
      "id": 10,
      'image_path': 'assets/Imgaes/10.webp',
      'Title': 'حداد',
      "SubTitle": "تفصيل واشغال جميع انواع الحدادة "
    },
    {
      "id": 11,
      'image_path': 'assets/Imgaes/11.webp',
      'Title': 'صيانة اجهزة منزلية',
      "SubTitle": "صيانة جمبع الاجهزة الكهربائية"
    },
    {
      "id": 12,
      'image_path': 'assets/Imgaes/12.webp',
      'Title': 'كهربائي ',
      "SubTitle": "صيانة وتمديد وحلول لكل مشاكل الكهربائية"
    },
    {
      "id": 13,
      'image_path': 'assets/Imgaes/13.webp',
      'Title': 'نجار ',
      "SubTitle": "كل ما بلزم بيتك من النجارة صيانة وتفصيل"
    },
    {
      "id": 14,
      'image_path': 'assets/Imgaes/14.webp',
      'Title': ' كاميرات المراقبة و الأنذار',
      "SubTitle": "تركيب جميع أجهزة الإنذار و الكاميرات و الحريق  "
    },
    {
      "id": 15,
      'image_path': 'assets/Imgaes/15.webp',
      'Title': ' الألمنيوم ',
      "SubTitle": " صيانة و تركيب كافة أشغال الألمنيوم "
    },
    {
      "id": 16,
      'image_path': 'assets/Imgaes/16.webp',
      'Title': ' خدمة الستلايت  ',
      "SubTitle": " خدمة صيانة و تركيب كافة أنواع الستلايت و خدمات التلفاز"
    },
  ];

  //------------------------------------------------------------------------------------//
  //----------------------- Carousal Controler Definition ------------------------------//
  //------------------------------------------------------------------------------------//
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  //------------------------------------------------------------------------------------//
  //----------------------- WhatsUp and Phone Configuration ----------------------------//
  //------------------------------------------------------------------------------------//
  final Uri phoneNumber = Uri.parse('tel:+970-569-494-224');
  final Uri whatsapp = Uri.parse('https://wa.me/970569494224');

  // var jsonData;

  // Future<void> loadJsonAsset() async {
  //   final String jsonString = await rootBundle.loadString('assets/data.json');
  //   var data = jsonDecode(jsonString);
  //   setState(() {
  //     jsonData = data;
  //   });
  //   //print(jsonData);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loadJsonAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerNave(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
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
      body: Stack(
        children: [
          /**
           * this container for the next slider 
           */

          Container(
            child: ClipPath(
              clipper: PannerClipper(),
              child: Container(
                // padding: const EdgeInsets.only(top: 50),
                  height: double.infinity,
                color: const Color.fromARGB(122, 199, 249, 244),
                child: Stack(children: [
                  Positioned(
                      bottom: 50,
                      
                   
                    height: MediaQuery.of(context).size.height * .7,
                    width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        itemCount: workimageList.length,
                        itemBuilder: (context, index) {
                          return Container(
                              decoration: myBoxDecoration(),
                              margin: const EdgeInsets.all(5),
                              child: SingleChildScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  child: Column(
                                children: [
                                    Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          workimageList[index]['Title'],
                                          style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                    GestureDetector(
                                        onTap: () => {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ImageScreen(
                                                        workimageList[index]
                                                            [
                                                                  "image_path"],
                                                        workimageList[index]
                                                            ['Title'])))
                                            },
                                            
                                      child: Image.asset(
                                        workimageList[index]["image_path"],
                                        height: 90,
                                        width: 90,
                                      ),
                                    ),
                                    Text(
                                      
                                      workimageList[index]['SubTitle'],
                                      textAlign: TextAlign.center,
                                      
                                    style: const TextStyle(
                                      
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 88, 90, 89)),
                                  ),

                                    ElevatedButton(
                                      //style:ButtonStyle()
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ImageScreen(
                                                        workimageList[index]
                                                            ["image_path"],
                                                        workimageList[index]
                                                            ['Title'])));
                                      },
                                      child: const Text('أحجز موعدا الآن'),
                                    ),
                                  ])));
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, mainAxisSpacing: 10),
                      ))
                  
                ]),
             
              ),
            ),
          ),
          Container(
            color: Colors.teal,
            child: Stack(
              children: [
                InkWell(
                  onTap: () => {},
                  child: CarouselSlider(
                      items: imageList
                          .map((item) => Image.network(item['image_path'],
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: LoadingAnimationWidget.inkDrop(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      size: 100),
                                );
                              }, fit: BoxFit.cover, width: double.infinity))
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) => {
                                setState(() {
                                  currentIndex = index;
                                })
                              })),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Stack(
                      children: [
                        Container(
                          height: 20,
                          width: double.infinity,
                          color: const Color.fromARGB(148, 0, 150, 135),
                          margin: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imageList.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () =>
                                    carouselController.animateToPage(entry.key),
                                child: Container(
                                  width: currentIndex == entry.key ? 17 : 10,
                                  height: 10.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: currentIndex == entry.key
                                          ? const Color.fromARGB(
                                              255, 255, 255, 255)
                                          : const Color.fromARGB(
                                              125, 255, 255, 255)),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                     
                     
                      ],
                    )),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}







/*{
       items: workimageList.map((item) {
                        return Builder(builder: (BuildContext contxt) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: myBoxDecoration(),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 150,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(50),
                                        bottomLeft: Radius.circular(50),
                                      ),
                                    ),
                                    child: GestureDetector(
                                        onTap: () => {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ImageScreen(
                                                              item[
                                                                  "image_path"],
                                                              item['Title'])))
                                            },
                                        child: Image.asset(
                                          item["image_path"],
                                          fit: BoxFit.scaleDown,
                                        )),
                                  ),
                                  Text(
                                    item['Title'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    item['SubTitle'],
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 88, 90, 89)),
                                  ),
                                  ElevatedButton(
                                    //style:ButtonStyle()
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ImageScreen(
                                                  item["image_path"],
                                                  item['Title'])));
                                    },
                                    child: const Text('أحجز موعدا الآن'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      }).toList(),
}*/
// ignore: slash_for_doc_comments
/**-------------------------------------------------------------------
 * ------------Define the Box Decoration For Work  -------------------
 * ---------------- Carosl Container Content  ------------------------
------------------------------------------------------------------- */

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border:
        Border.all(width: 0.2, color: Color.fromARGB(255, 208, 208, 208)),
    borderRadius: const BorderRadius.only(
      bottomRight: Radius.circular(50),
      bottomLeft: Radius.circular(50),
    ),
    color: Color.fromARGB(255, 250, 253, 253),
    boxShadow: const [
      BoxShadow(
        color: Color.fromARGB(255, 234, 251, 255),
        offset: Offset(9, 9),
        blurRadius: 5,
      ),
    ],
  );
}

// ignore: slash_for_doc_comments
/**-----------------------------------------------------------------
 * -------------this class to Re-shap the Panner -------------------
 * -----------and its content with all it components ---------------
------------------------------------------------------------------ */

class PannerClipper extends CustomClipper<Path> {
  var path = Path();

  @override
  Path getClip(Size size) {
  

    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 85);
    path.quadraticBezierTo(width / 2, height, width, height - 85);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
