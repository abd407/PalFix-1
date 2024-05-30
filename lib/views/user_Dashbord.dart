import 'dart:ui';
import 'dart:io';
import 'package:andallah/models/Services.dart';
import 'package:andallah/models/WebSitSlider.dart';
import 'package:andallah/views/DrawerNav.dart';
import 'package:andallah/views/PopUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../services/ApiController.dart';

class UserDashbord extends StatefulWidget {
  const UserDashbord({Key? key}) : super(key: key);

  @override
  _UserDashbordState createState() => _UserDashbordState();
}

class _UserDashbordState extends State<UserDashbord> {
//--------------------------------------------------//
//-------------- Defining Variables ----------------//
//--------------------------------------------------//

  List<Services>? _items;
  List<SlideShowData>? _slids;

  var isSlideLoaded = false;
  var isloaded = false;
  var loadNoInternetConnection = false;

  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

//--------------------------------------------------//
//-------------- Defining Costructore --------------//
//--------------------------------------------------//
  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    getData();
    getSlids();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      _connectionStatus = result;
    });

    for (var i = 0; i < _connectionStatus.length; i++) {
      if (_connectionStatus[i] == ConnectivityResult.none) {
        //--------------------------------------------------//
        //--------------- Fetching data from API------------//
        //--------------------------------------------------//
        
        setState(() {
          loadNoInternetConnection = true;
        });
      } else {
        setState(() {
          loadNoInternetConnection = false;
        });
        getData();
        getSlids();
      }
    }
    // ignore: avoid_print
    print('Connectivity changed: $_connectionStatus');
  }

//--------------------------------------------------//
//-------------- defining Function  ----------------//
//-------------- to get remote data  ---------------//
//--------------------------------------------------//
  getData() async {
    await ApiController.getServices().then((data) {

      if (data != null) {
        setState(() {
          //set is loading state to update grid
          isloaded = true;
          _items = data;
        });
        print(data);
        
      } else {
        
        setState(() {
          //set is loading state to update grid
          isloaded = false;
          _items = [];
        });
      }

      
    }).onError((error, stackTrace) {
//--------------------------------------------------//
//-------------- Here we should Handle    ----------//
//-------------- Error form http requet  -----------//

     
      setState(() {
        //set is loading state to update grid
        isloaded = false;
        _items = [];
      });
    });
  }

  //--------------------------------------------------//
//-------------- defining Function  ----------------//
//-------------- to get remote data  ---------------//
  getSlids() async {
    await ApiController.getSlidesContent().then((data) {
      if (data != null) {
        setState(() {
          //set is loading state to update grid
          isSlideLoaded = true;
          _slids = data;
        });

        print(data);
        
      } else {
        

        setState(() {
          //set is loading state to update grid
          isSlideLoaded = false;
          _slids = [];
        });
      }

      
    }).onError((error, stackTrace) {
//--------------------------------------------------//
//-------------- Here we should Handle    ----------//
//-------------- Error form http requet  -----------//

      
      setState(() {
        //set is loading state to update grid
        isSlideLoaded = false;
        _slids = [];
      });
    });
  }

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

  @override
  Widget build(BuildContext context) {
    if (loadNoInternetConnection) {
      return Scaffold(
          endDrawer: const DrawerNave(),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.teal,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
                    onPressed: () {
                      setState(() {});
                    },
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
          body: Container(
              child: Center(
                  child: Column(
            children: [
              Image.asset("assets/Imgaes/NoInternetConnection.jpg"),
              Text(
                "No Interner Connection",
                style: TextField.materialMisspelledTextStyle,
              ),
            ],
          ))));
    } else {
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
                  onPressed: () {
                    setState(() {});
                  },
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
                        top: 200,
                        height: MediaQuery.of(context).size.height * .7,
                        width: MediaQuery.of(context).size.width,
                        // ---------------------------------------------------------------//
                        //--------- This Section is for Work Grid-------------------------//
                        //---------------------------------------------------------------//
                        child: Visibility(
                            visible: isloaded,
                            replacement: Center(
                              child: LoadingAnimationWidget.staggeredDotsWave(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 100),
                            ),
                            child: GridView.builder(
                              itemCount: _items?.length,
                              itemBuilder: (context, index) {
                                if (_items![index].Status == 1) {
                                  return Container(
                                      decoration: myBoxDecoration(),
                                      margin: const EdgeInsets.all(5),
                                      child: SingleChildScrollView(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          child: Column(children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: Text(
                                                  _items![index].Title_ar,
                                                  style: const TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
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
                                                                _items![index]
                                                                    .Original_img,
                                                                _items![index]
                                                                    .Title_ar)))
                                              },
                                              child: _sizedContainer(
                                                  CachedNetworkImage(
                                                      imageUrl: _items![index]
                                                          .Original_img,
                                                      placeholder: (context, url) =>
                                                          LoadingAnimationWidget
                                                              .horizontalRotatingDots(
                                                                  color:
                                                                      const Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255),
                                                                  size: 100),
                                                      errorWidget:
                                                          (context, url, error) =>
                                                              const Icon(
                                                                  Icons.error),
                                                      fadeInDuration:
                                                          const Duration(seconds: 3)),
                                                  90,
                                                  90),
                                            ),
                                            Text(
                                              _items![index].Content_ar,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color.fromARGB(
                                                      255, 88, 90, 89)),
                                            ),
                                            ElevatedButton(
                                              //style:ButtonStyle()
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ImageScreen(
                                                                _items![index]
                                                                    .Original_img,
                                                                _items![index]
                                                                    .Title_ar)));
                                              },
                                              child:
                                                  const Text('أحجز موعدا الآن',
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      )),
                                            ),
                                          ])));
                                }
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, mainAxisSpacing: 10),
                            )))
                  ]),
                ),
              ),
            ),
            // ----------------------------------------------------------------------//
            //-------------------- Slides Container Starts here ---------------------//
            //-----------------------------------------------------------------------//
            Container(
              color: Colors.teal,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () => {},
                    child: Visibility(
                        visible: isSlideLoaded,
                        replacement: Center(
                          heightFactor: 1.2,
                          child: LoadingAnimationWidget.inkDrop(
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 50),
                        ),
                        child: CarouselSlider(
                            items: _slids
                                ?.map((item) => CachedNetworkImage(
                                    imageUrl: item.images,
                                    placeholder: (context, url) =>
                                        LoadingAnimationWidget
                                            .horizontalRotatingDots(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                size: 100),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fadeInDuration: const Duration(seconds: 3),
                                    fit: BoxFit.cover,
                                    width: double.infinity))
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
                                    })))

                    //-------------end slid Container -------------//
                    ,
                  )
                  /* Positioned(
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
                          child: Visibility(
                              visible: isSlideLoaded,
                              replacement: Center(
                                child: LoadingAnimationWidget.inkDrop(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    size: 200),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _slids.asMap().entries.map((entry) {
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
                              )),
                        ),
                      ],
                    )), */
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

Widget _sizedContainer(Widget child, double heightof, double widthof) {
  return SizedBox(
    width: heightof,
    height: widthof,
    child: Center(child: child),
  );
}

// ignore: slash_for_doc_comments
/**-------------------------------------------------------------------
 * ------------Define the Box Decoration For Work  -------------------
 * ---------------- Carosl Container Content  ------------------------
------------------------------------------------------------------- */

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(width: 0.2, color: Color.fromARGB(255, 208, 208, 208)),
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
