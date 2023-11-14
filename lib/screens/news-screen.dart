import 'package:application_sus/models/news-model.dart';
import 'package:application_sus/pallete.dart';
import 'package:application_sus/services/services.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsService newsService = NewsService(
    apiUrl:
        "https://newsdata.io/api/1/news?country=iq&apikey=pub_32835067ee38ecbb2de743e3c7490a77d8207",
  );

  late Future<News> newsFuture;

  @override
  void initState() {
    super.initState();
    newsFuture = getNews();
  }

  Future<News> getNews() async {
    return newsService.getNews();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('هناك مشكلة في الاتصال يرجى المحاولة لاحقا'),
                SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: kBlue),
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text(
                    'إعادة المحاولة',
                  ),
                ),
              ],
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.results == null) {
          return Center(
            child: Text('لا توجد أخبار متاحة'),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.results!.length,
            itemBuilder: (context, index) {
              Results result = snapshot.data!.results![index];
              return Card(
                elevation: 3.0,
                margin: EdgeInsets.all(10.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    title: Text(
                      result.title!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 150.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(result.imageUrl ?? ''),
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          result.description!,
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 14.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'تاريخ النشر: ${result.pubDate!}',
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 14.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'المصدر: ${result.sourceId ?? 'غير معروف'}',
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 14.0),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
