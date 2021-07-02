import 'package:GasStop/Pages/Trending/compontents/TrendingCardView.dart';
import 'package:flutter/material.dart';

class TrendingGasStationPage extends StatefulWidget {
  @override
  _TrendingGasStationPageState createState() => _TrendingGasStationPageState();
}

class _TrendingGasStationPageState extends State<TrendingGasStationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[TrendingCardViewPage()],
    );
  }
}
