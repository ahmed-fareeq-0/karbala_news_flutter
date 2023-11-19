import 'package:application_sus/pallete.dart';
import 'package:application_sus/screens/screens.dart';
import 'package:application_sus/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<String> _appBarTitles = ['الرئيسية', 'دردشة', ' عالمي'];

  final List<Widget> _screens = [
    NewsScreen(),
    SectionScreen(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                _appBarTitles[_currentIndex],
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
          fixedColor: kBlue,
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'دردشة',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'عالمي',
            ),
          ],
        ));
  }
}
