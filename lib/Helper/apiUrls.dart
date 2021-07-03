class APIUrls {
  ///firebase functions url
  late String gasStopCloudFunctionUrl =
      'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app';

  //user url Declarations
  late String addUserUrl =
      'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' + '/addUser';
  late String getCurrentUserUrl =
      'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
          '/getCurrentUser';
  late String updateUserUrl =
      'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
          '/updateUser';
  //gas Station url Declarations
  String addGasStationUrl =
      'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
          '/addGasStation';
  String getAllGasStationsUrl =
      'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app/allGasStations';
  String getLowestRegularPriceUrl =
      'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
          '/getLowestRegularPrice';
  String getLowestPremiumPriceUrl =
      'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
          '/getLowestPremiumPrice';
  String getLowestDieselPriceUrl =
      'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
          '/getLowestDieselPrice';
  String getLowestULSDPriceUrl =
      'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
          '/getLowestULSDPrice';
  String getGasStationByAddressUrl =
      'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
          'getGasStationByAddressUrl';
  //Comments urlsDeclarations
  String addNewCommentUrl =
      'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
          '/addComment';
  String getAllCommentsByStationIdUrl =
      'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
          '/addComment';
}
