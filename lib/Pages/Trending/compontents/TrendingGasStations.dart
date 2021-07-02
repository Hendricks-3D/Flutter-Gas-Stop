import 'package:flutter/material.dart';

//import 'package:adobe_xd/adobe_xd.dart';

class TrendingGasStation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //Navigator routes setup
      /*routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new TestPage(),
        '/signup': (BuildContext context) => new SignupPage(),
      },*/
      home: TrendingGasStation(),
    );
  }
}

class TrendingGasStationPage extends StatefulWidget {
  @override
  _TrendingGasStationPageState createState() => _TrendingGasStationPageState();
}

class _TrendingGasStationPageState extends State<TrendingGasStationPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Trending page'),
    );
  }
}
