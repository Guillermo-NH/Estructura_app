// To parse this JSON data, do
//
//     final loginAcceso = loginAccesoFromJson(jsonString);

import 'dart:convert';

LoginAcceso loginAccesoFromJson(String str) =>
    LoginAcceso.fromJson(json.decode(str));

String loginAccesoToJson(LoginAcceso data) => json.encode(data.toJson());

class LoginAcceso {
  String token;

  LoginAcceso({
    this.token,
  });

  factory LoginAcceso.fromJson(Map<String, dynamic> json) => LoginAcceso(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
