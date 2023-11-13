import 'package:application_sus/pallete.dart';
import 'package:application_sus/screens/login-screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Drawerf extends StatelessWidget {
  const Drawerf({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: kBlue,
            ),
            child: Container(
              width: double.infinity,
              height: 200,
              // padding: EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/photo_2023-11-09_23-27-59.jpg'),
                      ),
                    ),
                  ),
                  Text(
                    "ahmed fareeq",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "ahmed.fareeq.0@gmail.com",
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.newspaper),
                      Text(
                        'الاخبار',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.settings),
                      Text(
                        'الاعدادات',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.logout),
                      Text(
                        'تسجيل الخروج',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  logout(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void logout(BuildContext context) async {
    await removeToken();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
