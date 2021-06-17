//Flutter package imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//My Imports
import 'package:GasStop/Services/driverAuth.dart';
import 'package:GasStop/models/driver.dart';
import 'Signup.dart';
/*
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {
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
      //Navigator routes setup
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
      },
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Driver driver = new Driver();
  late TextEditingController emailController = new TextEditingController();
  late TextEditingController passwordController = new TextEditingController();
  late final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var token;
  @override
  Widget build(BuildContext context) {
    this.driver.name = "bobby";
    this.driver.email = "bobby@gmail.com";
    this.driver.password = "bobbypassword";
    this.driver.carType = "Benz";
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
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
                  child: Text('Login',
                      style: TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.bold))),

              //Dot text container
              Container(
                  padding: EdgeInsets.fromLTRB(150.0, 195.0, 0.0, 0.0),
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
                    SizedBox(height: 5.0), //Gives space between two widgets

                    //forgot password link/ InkWell
                    Container(
                        alignment: Alignment(1.0, 0.0), //align right
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                            child: Text('Forgot Password',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    color: const Color(0xffffc045))))),

                    SizedBox(height: 40.0), //Gives space between two widgets

                    //Login Button
                    Container(
                        height: 50.0,
                        child: Material(
                            borderRadius: BorderRadius.circular(20),
                            shadowColor: Colors.greenAccent,
                            color: const Color(0xffffc045),
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                DriverAuthService(this._firebaseAuth)
                                    .signInDriver(
                                        this.emailController.text.trim(),
                                        this.passwordController.text.trim());
                              },
                              child: Center(
                                child: Text('LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0)),
                              ),
                            ))),
                    SizedBox(height: 20.0), //Gives space between two widgets
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
                          //   SizedBox(width: 10.0), //Gives space
                          //adding the text
                          Container(
                            child: ImageIcon(
                              AssetImage('assets/google.png'),
                              size: 150.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0), //Gives space between two widgets
                    //Footer link
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('New To GasStop', style: TextStyle()),
                          SizedBox(width: 5.0),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/signup');
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: const Color(0xffffc045),
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ))
                        ])
                  ])),
            ]),
          )
        ]));
  } //end build method
}
