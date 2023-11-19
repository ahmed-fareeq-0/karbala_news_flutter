import 'dart:convert';

import 'package:application_sus/models/news-model.dart';
import 'package:http/http.dart';

class NewsService {
  final String apiUrl;
  NewsService({required this.apiUrl});

  Future<News> getNews() async {
    final response = await get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(utf8.decode(response.bodyBytes));
      // print(data['results']);
      return News.fromJson(data);
    } else {
      throw Exception('e from getNews function');
    }
  }
}
