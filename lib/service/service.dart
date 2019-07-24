import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:twosuk/model/content_model.dart';

String urlService = 'http://192.168.90.34/seniku/api';

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
