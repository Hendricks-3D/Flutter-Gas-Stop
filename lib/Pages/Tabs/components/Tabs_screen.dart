import 'package:GasStop/Pages/Home/components/Home_screen.dart';
import 'package:GasStop/Pages/Navigation/components/Navigation_screen.dart';
import 'package:GasStop/Pages/Trending/compontents/TrendingGasStations.dart';
import 'package:GasStop/Services/driverAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//import 'package:adobe_xd/adobe_xd.dart';

class TabsApp extends StatelessWidget {
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
      home: TabsPage(),
    );
  }
}

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  late final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    TrendingGasStationPage(),
    NavigationPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gas Stop'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                DriverAuthService(_firebaseAuth).signOut();
              },
              icon: Icon(Icons.logout))
        ],
        backgroundColor: Colors.grey[850],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 40.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.trending_up,
              size: 40.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              size: 40.0,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffffc045),
        onTap: _onItemTapped,
      ),
    );
  }
}
