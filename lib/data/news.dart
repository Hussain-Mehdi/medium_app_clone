class News {
  final String newsTitle;
  final String newsImage;
  final DateTime newsDate;
  final String authorName;
  final String newsURL;

  News(
      {required this.newsTitle,
      required this.newsImage,
      required this.newsDate,
      required this.authorName,
      required this.newsURL});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      newsTitle: json['title'] ?? "No Title",
      newsImage: json['urlToImage'] ?? "No Image",
      newsDate: DateTime.parse(json['publishedAt']) ?? DateTime.now(),
      authorName: json['author'] ?? 'No author',
      newsURL: json['url'] ?? "No Url",
    );
  }
}

List<News> userSavedNews = [];
