// To parse this JSON data, do
//
//     final station = stationFromJson(jsonString);
//Generated with: https://app.quicktype.io/
import 'dart:convert';

Station stationFromJson(String str) => Station.fromJson(json.decode(str));

String stationToJson(Station data) => json.encode(data.toJson());

class Station {
  Station({
    required this.telephone,
    required this.email,
    required this.ratings,
    required this.address,
    required this.airPump,
    required this.latitude,
    required this.reviewsAmount,
    required this.id,
    required this.premium,
    required this.diesel,
    required this.openTime,
    required this.name,
    required this.password,
    required this.closeTime,
    required this.longitude,
    required this.ulsd,
    required this.regular,
  });

  String telephone;
  String email;
  String ratings;
  String address;
  String airPump;
  String latitude;
  String reviewsAmount;
  String id;
  String premium;
  double diesel;
  String openTime;
  String name;
  String password;
  String closeTime;
  String longitude;
  double ulsd;
  String regular;

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        telephone: json["telephone"],
        email: json["email"],
        ratings: json["ratings"],
        address: json["address"],
        airPump: json["airPump"],
        latitude: json["latitude"],
        reviewsAmount: json["reviewsAmount"],
        id: json["id"],
        premium: json["premium"],
        diesel: json["diesel"].toDouble(),
        openTime: json["openTime"],
        name: json["name"],
        password: json["password"],
        closeTime: json["closeTime"],
        longitude: json["longitude"],
        ulsd: json["ULSD"].toDouble(),
        regular: json["regular"],
      );

  Map<String, dynamic> toJson() => {
        "telephone": telephone,
        "email": email,
        "ratings": ratings,
        "address": address,
        "airPump": airPump,
        "latitude": latitude,
        "reviewsAmount": reviewsAmount,
        "id": id,
        "premium": premium,
        "diesel": diesel,
        "openTime": openTime,
        "name": name,
        "password": password,
        "closeTime": closeTime,
        "longitude": longitude,
        "ULSD": ulsd,
        "regular": regular,
      };
}
