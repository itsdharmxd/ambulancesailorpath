// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

import 'dart:convert';

class Items {
  Items({
    this.ambulanceno,
    this.from,
    this.to,
    this.mobileno,
    this.duration,
  });

   String? ambulanceno;
   String? from;
   String? to;
   String? mobileno;
   int? duration;

  factory Items.fromRawJson(String str) => Items.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
   
  factory Items.fromJson(Map<String, dynamic> json) => Items(
        ambulanceno: json["ambulanceno"],
        from: json["from"],
        to: json["to"],
        mobileno: json["mobileno"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "ambulanceno": ambulanceno,
        "from": from,
        "to": to,
        "mobileno": mobileno,
        "duration": duration,
      };
      @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
