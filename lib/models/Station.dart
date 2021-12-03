// To parse this JSON data, do
//
//     final station = stationFromJson(jsonString);
//Generated with: https://app.quicktype.io/
import 'dart:convert';

Station stationFromJson(String str) => Station.fromJson(json.decode(str));

String stationToJson(Station data) => json.encode(data.toJson());

//These methods will  deal with the list like getting all gas Station
List<Station> stationFromJsonList(String str) =>
    List<Station>.from(json.decode(str).map((x) => Station.fromJsonList(x)));

String stationToJsonList(List<Station> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonList())));

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
  String diesel;
  String openTime;
  String name;
  String password;
  String closeTime;
  String longitude;
  String ulsd;
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
        diesel: json["diesel"],
        openTime: json["openTime"],
        name: json["name"],
        password: json["password"],
        closeTime: json["closeTime"],
        longitude: json["longitude"],
        ulsd: json["ULSD"],
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

//For Handling List

  factory Station.fromJsonList(Map<String, dynamic> json) => Station(
        telephone: json["telephone"],
        closeTime: json["closeTime"],
        reviewsAmount: json["reviewsAmount"],
        email: json["email"],
        ratings: json["ratings"],
        premium: json["premium"],
        ulsd: json["ULSD"],
        id: json["id"],
        longitude: json["longitude"],
        diesel: json["diesel"],
        address: json["address"],
        airPump: json["airPump"],
        password: json["password"],
        regular: json["regular"],
        openTime: json["openTime"],
        latitude: json["latitude"],
        name: json["name"],
      );

  Map<String, dynamic> toJsonList() => {
        "telephone": telephone,
        "closeTime": closeTime,
        "reviewsAmount": reviewsAmount,
        "email": email,
        "ratings": ratings,
        "premium": premium,
        "ULSD": ulsd,
        "id": id,
        "longitude": longitude,
        "diesel": diesel,
        "address": address,
        "airPump": airPump,
        "password": password,
        "regular": regular,
        "openTime": openTime,
        "latitude": latitude,
        "name": name,
      };
}
