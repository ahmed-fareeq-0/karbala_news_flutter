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
    var res = await get(Uri.parse(
        "https://newsdata.io/api/1/news?country=iq&apikey=pub_32835067ee38ecbb2de743e3c7490a77d8207"));
    List data = jsonDecode(res.body);
    return data;
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
      builder: (conext, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text("${snapshot.data![i]['title']}"),
            );
          },
        );
      },
    );
  }
}
