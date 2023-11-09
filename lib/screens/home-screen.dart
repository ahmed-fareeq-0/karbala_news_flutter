import 'package:application_sus/pallete.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الرئيسية',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kBlue,
        elevation: 5,
        iconTheme: IconThemeData(
            color: Colors.white), // تغيير لون الأيقونة الخاصة بالرجوع
      ),
      drawer: Drawer(
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
            ListTile(
              title: Text('الاخبار'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('الإعدادات'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'اخبار كربلاء ',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
