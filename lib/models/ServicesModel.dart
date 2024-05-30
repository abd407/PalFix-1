import 'dart:convert';

class ServicesData {
  String serviceId;
  String titleAr;
  String status;
  String images;

  ServicesData({
    required this.serviceId,
    required this.titleAr,
    required this.status,
    required this.images,
  });

  factory ServicesData.fromRawJson(String str) =>
      ServicesData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServicesData.fromJson(Map<String, dynamic> json) => ServicesData(
        serviceId: json["Service_ID"],
        titleAr: json["Title_ar"],
        status: json["Status"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "Service_ID": serviceId,
        "Title_ar": titleAr,
        "Status": status,
        "images": images,
      };
}
