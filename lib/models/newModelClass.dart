// To parse this JSON data, do
//
//     final userLogin = userLoginFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<UserLogin> userLoginFromMap(String str) => List<UserLogin>.from(json.decode(str).map((x) => UserLogin.fromMap(x)));

String userLoginToMap(List<UserLogin> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class UserLogin {
  UserLogin({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory UserLogin.fromMap(Map<String, dynamic> json) => UserLogin(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
