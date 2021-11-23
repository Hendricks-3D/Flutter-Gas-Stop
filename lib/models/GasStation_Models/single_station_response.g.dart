// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_station_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleStationResponse _$SingleStationResponseFromJson(
    Map<String, dynamic> json) {
  return SingleStationResponse()
    ..gasStation = GasStation.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SingleStationResponseToJson(
        SingleStationResponse instance) =>
    <String, dynamic>{
      'data': instance.gasStation,
    };
