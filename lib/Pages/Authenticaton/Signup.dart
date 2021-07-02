import 'package:GasStop/Services/driverAuth.dart';
import 'package:GasStop/models/driver.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//import 'package:adobe_xd/adobe_xd.dart';

class SignupApp extends StatelessWidget {
  ThemeData _light = ThemeData.light().copyWith(
    primaryColor: Colors.green,
  );
  ThemeData _darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey,
  );
  bool _isDark = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Change theme to black
      darkTheme: _darkTheme,
      themeMode: ThemeMode.dark,
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late Driver driver = new Driver();
  var token;
  var confirmPassword;
  late TextEditingController emailController = new TextEditingController();
  late TextEditingController passwordController = new TextEditingController();
  late TextEditingController confirmPasswordController =
      new TextEditingController();
  late TextEditingController userNameController = new TextEditingController();
  late TextEditingController carTypeController = new TextEditingController();
  late final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(children: <Widget>[
          Container(
            child: Stack(children: <Widget>[
              //Car Image text container
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                padding: EdgeInsets.fromLTRB(15.0, 200.0, 0.0, 0.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/car.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              //login text container
              Container(
                  padding: EdgeInsets.fromLTRB(15.0, 225.0, 0.0, 0.0),
                  child: Text('Sign Up',
                      style: TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.bold))),

              //Dot text container
              Container(
                  padding: EdgeInsets.fromLTRB(200.0, 195.0, 0.0, 0.0),
                  child: Text('.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffffc045)))),

              //text field container
              Container(
                  padding: EdgeInsets.only(top: 300.5, left: 20.0, right: 20.0),
                  child: Column(children: <Widget>[
                    //Email text field
                    TextField(
                        controller: this.emailController,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),

                            //Change textfield border to green
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)))),
                    SizedBox(height: 20.0), //Gives space between two widgets
                    //Password text field
                    TextField(
                      controller: this.passwordController,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),

                          //Change textfield border to green
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                      obscureText: true,
                    ),

                    SizedBox(height: 20.0), //Gives space between two widgets
                    //Password text field
                    TextField(
                      controller: this.confirmPasswordController,
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),

                          //Change textfield border to green
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                      obscureText: true,
                    ),
                    SizedBox(height: 20.0), //Gives space between two widgets
                    //Password text field
                    TextField(
                      controller: this.userNameController,
                      decoration: InputDecoration(
                          labelText: 'User Name',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),

                          //Change textfield border to green
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                    SizedBox(height: 20.0), //Gives space between two widgets
                    //Password text field
                    TextField(
                      controller: this.carTypeController,
                      decoration: InputDecoration(
                          labelText: 'Car Name',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),

                          //Change textfield border to green
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                    SizedBox(height: 20.0), //Gives space between two widgets
                    //sign up Button
                    Container(
                        height: 50.0,
                        child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffffc045),
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                //TODO:Wrap all this in if-statement to test password

                                this.confirmPassword =
                                    this.confirmPasswordController.text.trim();
                                //assign text fields values to driver object
                                this.driver.name =
                                    this.userNameController.text.trim();
                                this.driver.email =
                                    this.emailController.text.trim();
                                this.driver.password =
                                    this.passwordController.text.trim();
                                this.driver.carType =
                                    this.carTypeController.text.trim();

                                //register driver
                                DriverAuthService(this._firebaseAuth)
                                    .registerNewDriver(driver);
                              },
                              child: Center(
                                child: Text('Sign Up',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0)),
                              ),
                            ))),

                    /* SizedBox(height: 20.0), //Gives space between two widgets

                    //Facebook login button
                    Container(
                      height: 80.0,

                      //Adding image
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: ImageIcon(
                              AssetImage('assets/facebook.png'),
                              size: 150.0,
                            ),
                          ),
                          // SizedBox(width: 10.0), //Gives space
                          //adding the text
                          Container(
                            child: ImageIcon(
                              AssetImage('assets/google.png'),
                              size: 150.0,
                            ),
                          ),
                        ],
                      ),
                    ),*/
                  ])),
            ]),
          )
        ]));
  }
}
