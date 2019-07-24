import 'dart:convert';

NewsModel newsModelFromJson(String str) =>
    NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  String status;
  List<ArticlesModel> articles;

  NewsModel({
    this.status,
    this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => new NewsModel(
        status: json["status"],
        articles: new List<ArticlesModel>.from(
            json["articles"].map((x) => ArticlesModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "articles": new List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class ArticlesModel {
  String urlToImage;
  ArticlesModel({
    this.urlToImage,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => new ArticlesModel(
        urlToImage: json["urlToImage"],
      );

  Map<String, dynamic> toJson() => {
        "urlToImage": urlToImage,
      };
}
