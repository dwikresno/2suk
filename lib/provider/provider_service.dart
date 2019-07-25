import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:twosuk/model/content_model.dart';
import 'package:http/http.dart' as http;
import 'package:twosuk/model/new_model.dart';
import 'package:twosuk/model/photo_dart.dart';

String urlService = 'http://192.168.90.34/seniku/api';

class ProviderService with ChangeNotifier {
  int _counter = 0;

  getCounter() => _counter;

  setCounter(int counter) => _counter = counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }

  Future<ContentModel> getContent() async {
    var data;
    var params = {
      "mode": "get_banner",
      "ua": "Shop_Android_1",
      "uid": "1",
      "token": "0b7b368c99df42b592eb850c6e929244"
    };

    var res = await http.post(Uri.encodeFull(urlService),
        body: json.encode(params), headers: {"Accept": "application/json"});
    // print(res.statusCode);
    if (res.statusCode == 200) {
      data = res.body;
    }
    // print(res.body);
    return contentModelFromJson(data);
  }

  Future<NewsModel> getNews() async {
    urlService =
        "https://newsapi.org/v2/everything?q=bitcoin&from=2019-06-24&sortBy=publishedAt&apiKey=2726944d9e2d4e3ca8f6271f7e5b0daf";
    var data;
    var params = {
      "mode": "get_banner",
      "ua": "Shop_Android_1",
      "uid": "1",
      "token": "0b7b368c99df42b592eb850c6e929244"
    };

    var res = await http.get(Uri.encodeFull(urlService),
        headers: {"Accept": "application/json"});
    // print(res.statusCode);
    if (res.statusCode == 200) {
      data = res.body;
    }
    print(res.body);
    return newsModelFromJson(data);
  }

  Future<PhotoModel> getPhoto() async {
    urlService = "https://reqres.in/api/users";
    var data;
    var params = {
      "mode": "get_banner",
      "ua": "Shop_Android_1",
      "uid": "1",
      "token": "0b7b368c99df42b592eb850c6e929244"
    };

    var res = await http.get(Uri.encodeFull(urlService),
        headers: {"Accept": "application/json"});
    // print(res.statusCode);
    if (res.statusCode == 200) {
      data = res.body;
    }
    // print(res.body);
    return photoModelFromJson(data);
  }

  Future<List<PhotosModel>> getPhotoList(int index) async {
    urlService = "https://reqres.in/api/users?page=$index";
    var data;
    // var params = {
    //   "mode": "get_banner",
    //   "ua": "Shop_Android_1",
    //   "uid": "1",
    //   "token": "0b7b368c99df42b592eb850c6e929244"
    // };

    var res = await http.get(Uri.encodeFull(urlService),
        headers: {"Accept": "application/json"});
    // print(res.statusCode);
    if (res.statusCode == 200) {
      data = res.body;
    }

    List<PhotosModel> _dataListPhoto = [];
    Map decoded = jsonDecode(data);
    print(decoded);

    for (int i = 0; i < decoded["data"].length; i++) {
      // print(decoded["events"][i]["is_join"]);
      final PhotosModel allPhotoData = PhotosModel(
        id: decoded["data"][i]["id"],
        email:  decoded["data"][i]["email"],
        firstName:  decoded["data"][i]["first_name"],
        lastName:  decoded["data"][i]["last_name"],
        avatar:  decoded["data"][i]["avatar"],
      );

      _dataListPhoto.add(allPhotoData);
    }

    return _dataListPhoto;
  }
}
