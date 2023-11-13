import 'package:application_sus/config/data.dart';
import 'package:flutter/material.dart';

class NewsrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: NewsData.newsList.length,
      itemBuilder: (context, index) {
        return NewsItem(
          title: NewsData.newsList[index]['title'] ?? '',
          description: NewsData.newsList[index]['description'] ?? '',
          imagePath: NewsData.newsList[index]['imagePath'] ?? '',
        );
      },
    );
  }
}

class NewsItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const NewsItem({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
