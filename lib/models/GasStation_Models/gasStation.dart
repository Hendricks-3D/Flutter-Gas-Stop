import 'package:json_annotation/json_annotation.dart';

part 'gasStation.g.dart';

//Video: https://www.youtube.com/watch?v=lvRsi3PjckI&t=2143s
// flutter pub run build_runner build
@JsonSerializable()
class GasStation {
  @JsonKey(name: "id")
  late String id;

  @JsonKey(name: "name")
  late String name;

  @JsonKey(name: "password")
  late String password;

  @JsonKey(name: "email")
  late String email;

  @JsonKey(name: "telephone")
  late String telephone;

  @JsonKey(name: "regular")
  late String regular;

  @JsonKey(name: "premium")
  late String premium;

  @JsonKey(name: "diesel")
  late String diesel;

  @JsonKey(name: "ulsd")
  late String ulsd;

  @JsonKey(name: "openTime")
  late String openTime;

  @JsonKey(name: "closeTime")
  late String closeTime;

  @JsonKey(name: "address")
  late String address;

  @JsonKey(name: "latitude")
  late String latitude;

  @JsonKey(name: "longitude")
  late String longitude;

  @JsonKey(name: "ratings")
  late String ratings;

  @JsonKey(name: "reviewAmount")
  late String reviewsAmount;

  @JsonKey(name: "airpump")
  late String airPump;

  GasStation();
  factory GasStation.fromJson(Map<String, dynamic> json) =>
      _$GasStationFromJson(json);
  Map<String, dynamic> toJson() => _$GasStationToJson(this);
}
