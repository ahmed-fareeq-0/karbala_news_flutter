import 'package:application_sus/pallete.dart';
import 'package:application_sus/screens/news-screen.dart';
import 'package:application_sus/screens/sections-screen.dart';
import 'package:application_sus/drawer.dart';
import 'package:application_sus/screens/settings-screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    SectionsScreen(),
    SettingsScreen(),
    NewsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'الرئيسية',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          backgroundColor: kBlue,
          elevation: 5,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        endDrawer: Drawerf(),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'الفئات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'دردشة',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
          ],
        ));
  }
}
