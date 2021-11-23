// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gasStation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GasStation _$GasStationFromJson(Map<String, dynamic> json) {
  return GasStation()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..password = json['password'] as String
    ..email = json['email'] as String
    ..telephone = json['telephone'] as String
    ..regular = json['regular'] as String
    ..premium = json['premium'] as String
    ..diesel = json['diesel'] as String
    ..ulsd = json['ulsd'] as String
    ..openTime = json['openTime'] as String
    ..closeTime = json['closeTime'] as String
    ..address = json['address'] as String
    ..latitude = json['latitude'] as String
    ..longitude = json['longitude'] as String
    ..ratings = json['ratings'] as String
    ..reviewsAmount = json['reviewAmount'] as String
    ..airPump = json['airpump'] as String;
}

Map<String, dynamic> _$GasStationToJson(GasStation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'password': instance.password,
      'email': instance.email,
      'telephone': instance.telephone,
      'regular': instance.regular,
      'premium': instance.premium,
      'diesel': instance.diesel,
      'ulsd': instance.ulsd,
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'ratings': instance.ratings,
      'reviewAmount': instance.reviewsAmount,
      'airpump': instance.airPump,
    };
