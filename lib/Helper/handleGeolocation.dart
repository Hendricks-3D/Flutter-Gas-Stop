import 'package:geolocator/geolocator.dart';

// ignore: slash_for_doc_comments
/**
 * Note: Check that the first number in your latitude coordinate is between -90 and 90.
  * Check that the first number in your longitude coordinate is between -180 and 180.
 */

//13 Top Road Brown's Town
//lat: 18.391118, lng:-77.367254

class HandleGeolocation {
  double latitude = 18.391118;
  double longitude = -77.367254;

  getCurrentUserLocation() async {
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    this.latitude = location.latitude;
    this.longitude = location.longitude;
  }

  getLatitude() {
    return latitude;
  }

  getLongitude() {
    return longitude;
  }
}
