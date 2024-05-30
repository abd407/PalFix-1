

class Services {
  final int Service_ID;
  final int Status;
  final String Title_ar;
  final String Content_ar;
  final String Original_img;

  Services(
      {required this.Service_ID,
      required this.Status,
      required this.Content_ar,
      required this.Title_ar,
      required this.Original_img});

  factory Services.fromJson(dynamic json) {
    // --------------- get the key which is the id of the object ----------//
    
    //print('whatever you want to print ${id}');
    return Services(
      Service_ID: int.parse(json["Service_ID"]) as int,
      Status: int.parse(json['Status']) as int,
      Content_ar: json['Title_ar'] as String,
      Title_ar: json['Title_ar'] as String,
      Original_img: json['images'] as String,
    );
  }

  static List<Services> servicesFromSnapShot(List snapshot) {
   
    return snapshot.map((data) {
      return Services.fromJson(data);
    }).toList();
  }
}
