class News {
  String? status;
  int? totalResults;
  List<Results>? results;

  News({this.status, this.totalResults, this.results});

  News.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? articleId;
  String? title;
  String? link;
  List<String>? keywords;
  Null? creator;
  Null? videoUrl;
  String? description;
  String? content;
  String? pubDate;
  String? imageUrl;
  String? sourceId;
  int? sourcePriority;
  List<String>? country;
  List<String>? category;
  String? language;

  Results(
      {this.articleId,
      this.title,
      this.link,
      this.keywords,
      this.creator,
      this.videoUrl,
      this.description,
      this.content,
      this.pubDate,
      this.imageUrl,
      this.sourceId,
      this.sourcePriority,
      this.country,
      this.category,
      this.language});

  Results.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id'];
    title = json['title'];
    link = json['link'];
    keywords = json['keywords'].cast<String>();
    creator = json['creator'];
    videoUrl = json['video_url'];
    description = json['description'];
    content = json['content'];
    pubDate = json['pubDate'];
    imageUrl = json['image_url'];
    sourceId = json['source_id'];
    sourcePriority = json['source_priority'];
    country = json['country'].cast<String>();
    category = json['category'].cast<String>();
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article_id'] = this.articleId;
    data['title'] = this.title;
    data['link'] = this.link;
    data['keywords'] = this.keywords;
    data['creator'] = this.creator;
    data['video_url'] = this.videoUrl;
    data['description'] = this.description;
    data['content'] = this.content;
    data['pubDate'] = this.pubDate;
    data['image_url'] = this.imageUrl;
    data['source_id'] = this.sourceId;
    data['source_priority'] = this.sourcePriority;
    data['country'] = this.country;
    data['category'] = this.category;
    data['language'] = this.language;
    return data;
  }
}
