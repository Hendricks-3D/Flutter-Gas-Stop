class Urls {
  ///firebase functions url
  late String gasStopCloudFunctionUrl =
      'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app';

  //user url Declarations
  late String addUserUrl;
  late String getCurrentUserUrl;
  late String updateUserUrl;
  //gas Station url Declarations
  late String addGasStationUrl;
  late String getAllGasStationsUrl;
  late String getLowestRegularPriceUrl;
  late String getLowestPremiumPriceUrl;
  late String getLowestDieselPriceUrl;
  late String getLowestULSDPriceUrl;
  late String getGasStationByAddressUrl;
  //Comments urlsDeclarations
  late String addNewCommentUrl;
  late String getAllCommentsByStationIdUrl;

  Urls() {
    //user url intialization
    this.addUserUrl = this.gasStopCloudFunctionUrl + '/addUser';
    this.getCurrentUserUrl = this.getCurrentUserUrl + '/getCurrentUser';
    this.updateUserUrl = this.gasStopCloudFunctionUrl + '/updateUser';

    //gas station url intialization
    this.addGasStationUrl = this.gasStopCloudFunctionUrl + '/addGasStation';
    this.getAllGasStationsUrl =
        this.gasStopCloudFunctionUrl + '/getAllGasStations';
    this.getLowestRegularPriceUrl =
        this.gasStopCloudFunctionUrl + '/getLowestRegularPrice';
    this.getLowestPremiumPriceUrl =
        this.gasStopCloudFunctionUrl + '/getLowestPremiumPrice';
    this.getLowestDieselPriceUrl =
        this.gasStopCloudFunctionUrl + '/getLowestDieselPrice';
    this.getLowestULSDPriceUrl =
        this.gasStopCloudFunctionUrl + '/getLowestULSDPrice';
    this.getGasStationByAddressUrl =
        this.gasStopCloudFunctionUrl + 'getGasStationByAddressUrl';

    //comments url intialization
    this.addNewCommentUrl = this.gasStopCloudFunctionUrl + '/addComment';
    this.getAllCommentsByStationIdUrl =
        this.gasStopCloudFunctionUrl + '/getAllCommentsByStationId';
  }
}
