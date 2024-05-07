import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class UserDashbord extends StatefulWidget {
  const UserDashbord({Key? key}) : super(key: key);

  @override
  _UserDashbordState createState() => _UserDashbordState();
}

class _UserDashbordState extends State<UserDashbord> {
  List imageList = [
    {"id": 1, 'image_path': 'https://www.palfix.ps/content/3.png'},
    {"id": 2, 'image_path': 'https://www.palfix.ps/content/4.png'},
    {"id": 3, 'image_path': 'https://www.palfix.ps/content/5.png'},
    {"id": 4, 'image_path': 'https://www.palfix.ps/content/6.png'}
  ];
  final CarouselController carouselController = CarouselController();

  final Uri phoneNumber = Uri.parse('tel:+970-569-494-224');
  final Uri whatsapp = Uri.parse('https://wa.me/970569494224');

  int currentIndex = 0;

  final List<String> titles = [
    "RED",
    "YELLOW",
    "BLACK",
    "CYAN",
    "BLUE",
    "GREY",
  ];

  final List<Widget> images = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.cyan,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.grey,
    ),
  ];

  var jsonData;

  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data;
    });
    //print(jsonData);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
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
                  height: double.infinity,
                  color: const Color.fromARGB(123, 177, 255, 247),
                  child: Expanded(
                    child: VerticalCardPager(
                        titles: titles, // required
                        images: images, // required
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold), // optional
                        onPageChanged: (page) {
                          // optional
                        },
                        onSelectedItem: (index) {
                          // optional
                        },
                        initialPage: 0, // optional
                        align: ALIGN.CENTER, // optional
                        physics: const ClampingScrollPhysics() // optional
                        ),
                  )),
            ),
          ),
          Container(
            child: ClipPath(
              clipper: PannerClipper(),
              child: Container(
                height: 230,
                color: Color.fromARGB(255, 0, 150, 135),
              ),
            ),
          ),
          ClipPath(
              clipper: PannerClipper(),
              child: Container(
                child:
                    //const Drawer(),
                    Stack(
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
                                          color: Colors.teal, size: 100),
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
                        top: 0,
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
                                children:
                                    imageList.asMap().entries.map((entry) {
                                  return GestureDetector(
                                    onTap: () => carouselController
                                        .animateToPage(entry.key),
                                    child: Container(
                                      width:
                                          currentIndex == entry.key ? 17 : 10,
                                      height: 10.0,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
              )),
        ],
      ),
    );
  }
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
    path.lineTo(0, size.height - 100);

    /*
    second Point Position
    */
    var firstStart = Offset(size.width / 7, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    /*
    second Line drawing
    */
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    /*
    Third  Point Position
    */
    var secondStart =
        Offset(size.width - (size.width / 4.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height - 10);

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
