import 'package:flutter/material.dart';

//import 'package:adobe_xd/adobe_xd.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //Navigator routes setup
      /*routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new TestPage(),
        '/signup': (BuildContext context) => new SignupPage(),
      },*/
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250.0,
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
                      Text('Station', style: TextStyle(fontSize: 20.0)),
                      SizedBox(width: 160.0),
                      Text('Info', style: TextStyle(fontSize: 20.0))
                    ],
                  ),
                ),

                //Second Row

                //Navigate Buttonr
                Container(
                    margin: EdgeInsets.fromLTRB(0.0, 205.0, 0.0, 0.0),
                    height: 70.0,
                    child: Material(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.zero, bottom: Radius.circular(5.0)),
                        color: const Color(0xffffc045),
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {},
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
