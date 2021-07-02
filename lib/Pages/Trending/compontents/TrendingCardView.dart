import 'package:GasStop/Helper/CustomColors.dart';
import 'package:flutter/material.dart';

class TrendingCardViewPage extends StatefulWidget {
  @override
  _TrendingCardViewPageState createState() => _TrendingCardViewPageState();
}

class _TrendingCardViewPageState extends State<TrendingCardViewPage> {
  CustomColors customColors = new CustomColors();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Material(
      child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          padding: EdgeInsets.fromLTRB(0.0, 300.0, 0.0, 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              image: AssetImage('assets/gasStation.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Row(
          children: <Widget>[
            SizedBox(width: 25.0),
            Icon(Icons.favorite_outline),
            SizedBox(width: 10.0),
            Icon(Icons.chat_bubble_outlined),
            SizedBox(width: 10.0),
            Icon(Icons.share_outlined),
            SizedBox(width: 190.0),
            InkWell(
              onTap: () {
                print('Navigate');
              },
              child: Text(
                'Navigate',
                style: TextStyle(
                    color: customColors.mainOrange,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
        SizedBox(height: 5.0),
        Row(
          children: <Widget>[
            SizedBox(width: 25.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('100 Likes', style: TextStyle(fontSize: 16.0)),
                SizedBox(height: 5.0),
                Text('Opening Hours: 7:30am-12:00am',
                    style: TextStyle(fontSize: 16.0)),
                SizedBox(height: 5.0),
                Text('Promotion: Free windshield cleaning',
                    style: TextStyle(fontSize: 16.0)),
                SizedBox(height: 5.0),
                InkWell(
                  onTap: () {
                    print('Navigate');
                  },
                  child: Text(
                    'View all 27 comments',
                    style: TextStyle(color: Colors.grey[300], fontSize: 12.0),
                  ),
                )
              ],
            ),
          ],
        ),
      ]),
    ));
  }
}
