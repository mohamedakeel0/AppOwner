class ModelEdite {
  String? name;
  String? type;
  String? adress;
  String? date;
  String? phone;
  String? late;
  String? long;
  String? file;



  ModelEdite.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    adress = json['adress'];
    date = json['date'];
    phone = json['phone'];
    late = json['late'];
    long = json['long'];
    file = json['file'];

  }


}