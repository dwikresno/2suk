import 'dart:convert';

ContentModel contentModelFromJson(String str) =>
    ContentModel.fromJson(json.decode(str));

String contentModelToJson(ContentModel data) => json.encode(data.toJson());

class ContentModel {
  String status;
  String desc;
  List<BannerModel> banner;

  ContentModel({
    this.status,
    this.desc,
    this.banner,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) => new ContentModel(
        status: json["status"],
        desc: json["desc"],
        banner: new List<BannerModel>.from(
            json["ar_banner"].map((x) => BannerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "desc": desc,
        "ar_banner": new List<dynamic>.from(banner.map((x) => x.toJson())),
      };
}

class BannerModel {
  String id;
  String title;
  String body;
  String time;
  String idAuthor;
  String image;
  BannerModel({
    this.id,
    this.title,
    this.body,
    this.time,
    this.idAuthor,
    this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => new BannerModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        time: json["time"],
        idAuthor: json["id_author"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "time": time,
        "id_author": idAuthor,
        "image": image,
      };
}
