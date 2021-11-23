import 'package:GasStop/models/GasStation_Models/gasStation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_station_response.g.dart';

@JsonSerializable()
class SingleStationResponse {
  @JsonKey(name: "data")
  GasStation gasStation = new GasStation();

  SingleStationResponse();

  factory SingleStationResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleStationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SingleStationResponseToJson(this);
}
