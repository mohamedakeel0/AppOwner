class ModelShop {
  String? id;
  String? name;
  String? lat;
  String? long;
  String? address;
  String? phone;
  int? rate;
  String? image;
  List<String>? gallery;
  List<Reviews>? reviews;



  ModelShop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    long = json['long'];
    address = json['address'];
    phone = json['phone'];
    rate = json['rate'];
    image = json['image'];
    gallery = json['gallery'].cast<String>();
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
  }


}

class Reviews {
  String? user;
  int? rate;
  String? review;


  Reviews.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    rate = json['rate'];
    review = json['review'];
  }


}