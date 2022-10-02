class LoginModel {
  bool? reply;
  String? ownerId;

  LoginModel({this.reply, this.ownerId});

  LoginModel.fromJson(Map<String, dynamic> json) {
    reply = json['reply'];
    ownerId = json['owner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reply'] = this.reply;
    data['owner_id'] = this.ownerId;
    return data;
  }
}