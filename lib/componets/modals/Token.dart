// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  Token({
     this.token,
     this.latitude,
     this.longitude,
  });

   String? token;
   double? latitude;
   double? longitude;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["token"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "latitude": latitude,
        "longitude": longitude,
      };
}
