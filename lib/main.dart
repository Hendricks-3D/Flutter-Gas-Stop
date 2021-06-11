import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Services/driverAuth.dart';
import 'package:gas_stop/Models/driver.dart';

//import 'package:adobe_xd/adobe_xd.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //Navigator routes setup
      /*routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new TestPage(),
        '/signup': (BuildContext context) => new SignupPage(),
      },*/
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Driver driver = new Driver();
  var token;
  @override
  Widget build(BuildContext context) {
    this.driver.name = "bobby";
    this.driver.email = "bobby@gmail.com";
    this.driver.password = "bobbypassword";
    this.driver.carType = "Benz";
    return Scaffold(
        appBar: AppBar(
          title: Text('Gas Stop'),
          backgroundColor: Colors.orange[900],
        ),
        body: Column(children: <Widget>[
          //register Button
          Container(
              height: 40.0,
              child: Material(
                  borderRadius: BorderRadius.circular(20),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap: () {
                      DriverAuthService().registerNewDriver(this.driver);
                    },
                    child: Center(
                      child: Text('register',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ))),

          SizedBox(height: 20.0),

          //login Button
          Container(
              height: 40.0,
              child: Material(
                  borderRadius: BorderRadius.circular(20),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap: () {
                      DriverAuthService().signInDriver(this.driver).then((val) {
                        if (val.data['success']) {
                          // this.user.token = val.data['token'];
                          Fluttertoast.showToast(
                              msg: 'user Logged in',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey[600],
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          Fluttertoast.showToast(
                              msg: 'authentication failed',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey[600],
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      });
                    },
                    child: Center(
                      child: Text('LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ))),
        ]));
  } //end build method
}
