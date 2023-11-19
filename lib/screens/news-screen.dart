import 'package:application_sus/models/news-model.dart';
import 'package:application_sus/pallete.dart';
import 'package:application_sus/screens/sport-screen.dart';
import 'package:application_sus/services/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var _currentIndex = 0;
  final List<String> categories = [
    'علوم',
    'تكنولوجيا',
    'رياضة',
    'فنون',
    'صحة',
    'سياسة',
  ];
  final List itemsss = [Colors.red, Colors.purple, Colors.amber, Colors.black];
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                categories.length,
                (index) => InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SportScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        color: kBlue,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Container(
        //   margin: EdgeInsets.symmetric(vertical: 5),
        //   child: CarouselSlider(
        //     items: itemsss.map((item) {
        //       return Builder(builder: (BuildContext context) {
        //         return Container(
        //           child: Stack(children: [
        //             ClipRRect(
        //               borderRadius: BorderRadius.circular(10),
        //               child: Image.asset(
        //                 "assets/images/newss.jpg",
        //                 height: double.infinity,
        //                 fit: BoxFit.fitHeight,
        //               ),
        //             )
        //           ]),
        //         );
        //       });
        //     }).toList(),
        //     options: CarouselOptions(
        //       height: 200,
        //       autoPlay: true,
        //       enlargeCenterPage: true,
        //     ),
        //   ),
        // ),
        Expanded(
          child: FutureBuilder(
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
                            result.title ?? "عنوان الخبر",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
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
                                    image: NetworkImage(result.imageUrl ??
                                        'https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png'),
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                result.description ?? "وصف الخبر",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 14.0),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'تاريخ النشر: ${result.pubDate ?? "تاريخ النشر"}',
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
          ),
        ),
      ],
    );
  }
}
