import 'dart:convert';

class SlideShowData {
  String slideId;
  String titleAr;
  dynamic slideCaptionAr;
  String images;

  SlideShowData({
    required this.slideId,
    required this.titleAr,
    required this.slideCaptionAr,
    required this.images,
  });

  factory SlideShowData.fromRawJson(String str) =>
      SlideShowData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SlideShowData.fromJson(Map<String, dynamic> json) => SlideShowData(
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
