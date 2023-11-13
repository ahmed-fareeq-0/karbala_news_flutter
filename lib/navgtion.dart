import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key, required this.currentIndex});
  final currentIndex;

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  var currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: 'الأخبار',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'الإعدادات',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'الرئيسية',
        ),
      ],
    );
  }
}
