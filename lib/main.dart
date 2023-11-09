import 'package:application_sus/screens/home-screen.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Cairo-Medium",
      ),
      debugShowCheckedModeBanner: false,
      title: 'Foodybite',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        'ForgotPassword': (context) => ForgotPassword(),
        'CreateNewAccount': (context) => CreateNewAccount(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
