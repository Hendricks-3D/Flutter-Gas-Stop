import 'package:geolocator/geolocator.dart';

class HandleGeolocation {
  late double latititude;
  late double longitude;

  getCurrentUserLocation() async {
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    this.latititude = location.latitude;
    this.longitude = location.longitude;
  }
}
