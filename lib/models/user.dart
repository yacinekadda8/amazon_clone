class User {
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;
  final String id;
  int? v;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.token,
    required this.id,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        address: json["address"],
        type: json["type"],
        token: json["token"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "address": address,
        "type": type,
        "token": token,
        "_id": id,
        "__v": v,
      };
}
