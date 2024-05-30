import 'dart:convert';

class SlideShowData1 {
  String slideId;
  String titleAr;
  dynamic slideCaptionAr;
  String images;

  SlideShowData1({
    required this.slideId,
    required this.titleAr,
    required this.slideCaptionAr,
    required this.images,
  });

  factory SlideShowData1.fromRawJson(String str) =>
      SlideShowData1.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SlideShowData1.fromJson(Map<String, dynamic> json) => SlideShowData1(
        slideId: json["Slide_ID"],
        titleAr: json["Title_ar"],
        slideCaptionAr: json["Slide_Caption_ar"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "Slide_ID": slideId,
        "Title_ar": titleAr,
        "Slide_Caption_ar": slideCaptionAr,
        "images": images,
      };
}




class SlideShowData {
  String slideId;
  
  String images;

  SlideShowData({
    required this.slideId,
    required this.images,
    
  });

  factory SlideShowData.fromJson(dynamic json) {
    // --------------- get the key which is the id of the object ----------//
    
    return SlideShowData(
      slideId: json["Slide_ID"] as String,
      images: json['images'] as String,
     
     
    );
  }

  static List<SlideShowData> SlidesFromSnapShot(List snapshot) {
    return snapshot.map((data) {
    
      return SlideShowData.fromJson(data);
    }).toList();
  }
}
