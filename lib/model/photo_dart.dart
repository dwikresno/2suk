import 'dart:convert';

PhotoModel photoModelFromJson(String str) =>
    PhotoModel.fromJson(json.decode(str));

String photoModelToJson(PhotoModel data) => json.encode(data.toJson());

class PhotoModel {
  // String status;
  int page;
  int perPage;
  int total;
  int totalPages;
  List<PhotosModel> photos;

  PhotoModel({
    // this.status,
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.photos,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) => new PhotoModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        photos: new List<PhotosModel>.from(
            json["data"].map((x) => PhotosModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": new List<dynamic>.from(photos.map((x) => x.toJson())),
      };
}

class PhotosModel {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  PhotosModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory PhotosModel.fromJson(Map<String, dynamic> json) => new PhotosModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
