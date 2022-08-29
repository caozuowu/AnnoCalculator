import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class ConsumeMap {
  ConsumeMap();
  static ConsumeMap? _singleton;
  Map<String, Consume> _map = {};
  ConsumeMap._create();
  static Future<ConsumeMap> shareInstance() async {
    // ignore: unnecessary_null_comparison
    if (_singleton! == null) {
      var component = ConsumeMap._create();
      component._map = {};
      for (var name in ["old_world", "new_world", "arctic", "africa"]) {
        var jstring = await rootBundle.loadString("assets/$name.json");
        var data = jsonDecode(jstring);
        component._map[name] = Consume.fromJson(data);
      }
      _singleton = component;
    }
    return _singleton!;
  }

  Consume? getConsume(String name) {
    return _map[name];
  }
}

class Consume {
  //resident
  List<String> rowIndex = [];
  //product
  List<String> columeIndex = [];
  List<List<dynamic>> data = [];

  Consume();

  Consume.fromJson(Map<String, dynamic> json) {
    rowIndex = List<String>.from(json['rowIndex']);
    columeIndex = List<String>.from(json['columeIndex']);
    data = json['data'];
  }

  Map<String, double> forResident(String resident) {
    var result = <String, double>{};
    var r = rowIndex.indexOf(resident);
    for (var c = 0; c < (columeIndex.length); c++) {
      var name = columeIndex[c];
      var value = data[r][c];
      if (value != 0 && value != null) {
        result[name] = value;
      }
    }
    return result;
  }

  Map<String, double> forProduct(String product) {
    var result = <String, double>{};
    var c = columeIndex.indexOf(product);
    for (var r = 0; r < data.length; r++) {
      var name = rowIndex[r];
      var value = data[r][c];
      if (value != null && value != 0) {
        result[name] = value;
      }
    }
    return result;
  }

  double forResidentAndProduct(String resident, String product) {
    var r = rowIndex.indexOf(resident);
    var c = columeIndex.indexOf(product);
    return data[c][r];
  }
}
