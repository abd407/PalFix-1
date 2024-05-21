
class WebSitSlider {
  final String Slide_Image;
  final String Slide_Image_Mobile;
  final int Slide_ID;
  final int Caption_Status;
  final String Title_ar;
  final String Title_en;

  WebSitSlider({
    required this.Slide_Image,
    required this.Slide_ID,
    required this.Caption_Status,
    this.Title_ar = "",
    this.Title_en = "",
    this.Slide_Image_Mobile = "",
  });

  factory WebSitSlider.fromJson(dynamic json) {
    // --------------- get the key which is the id of the object ----------//
    String id = json.keys.toList()[0];
    //print('whatever you want to print ${id}');
    return WebSitSlider(
      Slide_ID: int.parse(id),
      Caption_Status: json[id]['Caption_Status'] as int,
      Slide_Image: json[id]['Slide_Image'] as String,
      Title_ar: json[id]['title_ar'] as String,
      Title_en: json[id]['Title_en'] as String,
      Slide_Image_Mobile: json[id]['Slide_Image_Mobile'] as String,
    );
  }

  static List<WebSitSlider> servicesFromSnapShot(List snapshot) {
    return snapshot.map((data) {
      return WebSitSlider.fromJson(data);
    }).toList();
  }
}
