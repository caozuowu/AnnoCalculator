// ignore: file_names
import 'dart:convert';
import 'package:flutter/services.dart';

class JsonData {
  static final JsonData _singleton = JsonData();
  static load() async {
    var paths = [
      "assets/resident.json",
      "assets/product.json",
      "assets/consume.json"
    ];
    _singleton._map = {};
    for (var path in paths) {
      var jstring = await rootBundle.loadString(path);
      _singleton._map[path] = jsonDecode(jstring);
      //print(_singleton._map);
    }
  }
  static JsonData shareInstance() {
    return _singleton;
  }
  Map<String, dynamic> _map = {};
  dynamic get(String path) {
    return _map[path];
  }
}