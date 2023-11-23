// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String? token;
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? address;
  final String? type;
  final int? iV;

  User(
      {required this.token,
      required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.address,
      required this.type,
      required this.iV});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'iV': iV,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      token: map['token'] != null ? map['token'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      iV: map['iV'] != null ? map['iV'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

// class User {
//   final String name;
//   final String email;
//   final String password;
//   final String address;
//   final String type;
//   final String token;
//   final String id;
//   int? v;

//   User({
//     required this.name,
//     required this.email,
//     required this.password,
//     required this.address,
//     required this.type,
//     required this.token,
//     required this.id,
//     this.v,
//   });

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       name: map["name"] ?? "",
//       email: map["email"] ?? "",
//       password: map["password"] ?? "",
//       address: map["address"] ?? "",
//       type: map["type"] ?? "",
//       token: map["token"] ?? "",
//       id: map["_id"] ?? "",
//       v: map["__v"] as int?,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "email": email,
//         "password": password,
//         "address": address,
//         "type": type,
//         "token": token,
//         "_id": id,
//         "__v": v,
//       };
// }
