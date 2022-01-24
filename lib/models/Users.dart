class Users {
  String? email;
  String? name;
  String? admin;
  String? id;

  Users({this.email, this.name, this.admin, this.id});

  Users.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    admin = json['admin'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email.toString();
    data['name'] = name.toString();
    data['admin'] = admin.toString();
    data['id'] = id.toString();
    return data;
  }
}
