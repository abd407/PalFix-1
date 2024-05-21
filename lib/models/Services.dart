

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
    String id = json.keys.toList()[0];
    //print('whatever you want to print ${id}');
    return Services(
      Service_ID: int.parse(id),
      Status: json[id]['status'] as int,
      Content_ar: json[id]['cont_ar'] as String,
      Title_ar: json[id]['title_ar'] as String,
      Original_img: json[id]['Original_img'] as String,
    );
  }

  static List<Services> servicesFromSnapShot(List snapshot) {
    return snapshot.map((data) {
      return Services.fromJson(data);
    }).toList();
  }
}
