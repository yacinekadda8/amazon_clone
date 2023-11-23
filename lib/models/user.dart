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

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map["name"] ?? "",
      email: map["email"] ?? "",
      password: map["password"] ?? "",
      address: map["address"] ?? "",
      type: map["type"] ?? "",
      token: map["token"] ?? "",
      id: map["_id"] ?? "",
      v: map["__v"] as int?,
    );
  }

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
