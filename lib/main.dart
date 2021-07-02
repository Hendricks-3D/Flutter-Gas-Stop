//Flutter package imports
import 'package:GasStop/Pages/Authenticaton/Login.dart';
import 'package:GasStop/Pages/Tabs/components/Tabs_screen.dart';
import 'package:GasStop/Services/driverAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ThemeData _light = ThemeData.light().copyWith(
    primaryColor: Colors.green,
  );
  ThemeData _darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey,
  );
  bool _isDark = true;

  var providers;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<DriverAuthService>(
            create: (_) => DriverAuthService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
                context.read<DriverAuthService>().authStateChanges,
            initialData: null,
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,

          //Change theme to black
          darkTheme: _darkTheme,
          themeMode: ThemeMode.dark,
          //Navigator routes setup
          home: AuthenticationWrapper(),
        ));
  }
}

class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapper createState() => _AuthenticationWrapper();
}

class _AuthenticationWrapper extends State<AuthenticationWrapper> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      print('user already signed in');
      return TabsApp();
    }

    print('no user');
    return LoginPage();
  } //end build method
}
