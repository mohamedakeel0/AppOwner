class ModeldetailsServices {
  String? id;
  String? name;
  int? rate;
  Null? desc;
  String? image;
  List<String>? gallery;
  Category? category;
  Shop? shop;


  ModeldetailsServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rate = json['rate'];
    desc = json['desc'];
    image = json['image'];
    gallery = json['gallery'].cast<String>();
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
  }

}

class Category {
  String? name;
  String? id;
  String? icon;
  String? iconName;
  Null? color;
  String? colorName;

  Category(
      {this.name,
        this.id,
        this.icon,
        this.iconName,
        this.color,
        this.colorName});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    icon = json['icon'];
    iconName = json['icon_name'];
    color = json['color'];
    colorName = json['color_name'];
  }


}

class Shop {
  String? id;
  String? name;
  String? lat;
  String? long;
  String? address;
  String? phone;
  int? rate;



  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    long = json['long'];
    address = json['address'];
    phone = json['phone'];
    rate = json['rate'];
  }


}