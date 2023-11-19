import 'package:application_sus/screens/home-screen.dart';
import 'package:application_sus/screens/sport-screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Cairo-Medium",
      ),
      debugShowCheckedModeBanner: false,
      title: 'Foodybite',
      home: FutureBuilder(
        future: checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data as Widget;
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      routes: {
        'ForgotPassword': (context) => ForgotPassword(),
        'CreateNewAccount': (context) => CreateNewAccount(),
        '/home': (context) => HomeScreen(),
        '/newsDetails': (context) => NewsDetails(),
        '/sportScreen': (context) => SportScreen(),
      },
    );
  }

  Future<Widget> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    if (token.isNotEmpty) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}
