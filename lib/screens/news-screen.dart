import 'dart:convert';

import 'package:application_sus/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Future<News> getNews() async {
    // final String apiUrl = 'https://newsdata.io/api/1/news?country=iq&apikey=pub_32835067ee38ecbb2de743e3c7490a77d8207';
    // final String country = 'us'; // يمكنك تغيير الدولة حسب احتياجاتك

    final response = await get(Uri.parse(
        "https://newsdata.io/api/1/news?country=iq&apikey=pub_32835067ee38ecbb2de743e3c7490a77d8207"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(utf8.decode(response.bodyBytes));
      print(data['results']);
      return News.fromJson(data);
    } else {
      throw Exception('فشل في الاتصال بالخادم');
    }
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getNews(),
      builder: (context, AsyncSnapshot<News> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('حدث خطأ أثناء جلب الأخبار: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.results == null) {
          return Center(
            child: Text('لا توجد أخبار متاحة'),
          );
        } else {
          // عرض قائمة الأخبار هنا
          return ListView.builder(
            itemCount: snapshot.data!.results!.length,
            itemBuilder: (context, index) {
              Results result = snapshot.data!.results![index];
              return ListTile(
                title: Text(result.title ?? ''),
                subtitle: Text(result.description ?? ''),
                // يمكنك تخصيص عرض الخبر كما تشاء
              );
            },
          );
        }
      },
    );
  }
}
