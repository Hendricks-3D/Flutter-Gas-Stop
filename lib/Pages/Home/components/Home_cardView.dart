import 'package:GasStop/Helper/CustomColors.dart';
import 'package:GasStop/Helper/handleGeolocation.dart';
import 'package:GasStop/models/Station.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeCardViewPage extends StatefulWidget {
  //This constructor is use to collect the data being passed
  Station
      station; //this variable is accessed by widget.station.name in _HomeCardViewPageState
  String selectedOption = 'Premium';
  HomeCardViewPage(this.station, selectedOption);

  @override
  _HomeCardViewPageState createState() => _HomeCardViewPageState();
}

class _HomeCardViewPageState extends State<HomeCardViewPage> {
  CustomColors customColors = new CustomColors();
  HandleGeolocation location = new HandleGeolocation();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300.0,
        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: Material(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.grey[800],
            child: Stack(
              children: <Widget>[
                //First Row -- Headings
                Container(
                  padding: EdgeInsets.fromLTRB(50.0, 10.0, 0.0, 5.0),
                  child: Row(
                    children: <Widget>[
                      //-----

                      //Left Column
                      Column(
                        children: <Widget>[
                          Text('${widget.station.name}',
                              style: TextStyle(fontSize: 20.0)),
                          SizedBox(height: 20.0),
                          //TODO: To be replaces with gas station logo
                          Icon(
                            Icons.ev_station,
                            size: 60.0,
                            color: Colors.blue,
                          ),

                          SizedBox(height: 30.0),

                          Text('Rating', style: TextStyle(fontSize: 20.0)),
                          Row(
                            children: <Widget>[
                              Icon(Icons.chat,
                                  color: customColors.mainOrange, size: 20),
                              SizedBox(width: 5),
                              Text(widget.station.ratings),
                            ],
                          ),
                          Text('${widget.station.reviewsAmount} reviews')
                        ],
                      ),
                      SizedBox(width: 10.0),
                      //---

                      //Right Column
                      Column(
                        children: <Widget>[
                          Text('Info', style: TextStyle(fontSize: 20.0)),
                          SizedBox(height: 20.0),
                          Text('Status', style: TextStyle(fontSize: 18.0)),
                          Text(widget.station.openTime,
                              style: TextStyle(color: customColors.mainOrange)),
                          Text('Air Pump', style: TextStyle(fontSize: 18.0)),
                          Text(widget.station.airPump,
                              style: TextStyle(color: customColors.mainOrange)),
                          SizedBox(height: 40.0),
                          Text('${widget.selectedOption} Price',
                              style: TextStyle(fontSize: 18.0)),
                          Text('\$ ${widget.station.premium}',
                              style: TextStyle(
                                  color: customColors.mainOrange,
                                  fontSize: 21.0)),
                          Text('Per litre')
                        ],
                      ),
                    ],
                  ),
                ),

                //Second Row

                //Navigate Button
                Container(
                    margin: EdgeInsets.fromLTRB(0.0, 255.0, 0.0, 0.0),
                    height: 150.0,
                    child: Material(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.zero, bottom: Radius.circular(5.0)),
                        color: customColors.mainOrange,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            this.location.getCurrentUserLocation();
                            print(this.location.longitude);
                            print(this.location.latitude);
                          },
                          child: Center(
                            child: Text('Navigate',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23.0)),
                          ),
                        ))),
              ],
            )));
  }
}
