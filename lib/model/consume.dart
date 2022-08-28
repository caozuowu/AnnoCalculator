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
        var jstring =
            await rootBundle.loadString("assets/image/resident/$name.json");
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
  List<String>? rowIndex = [];
  //product
  List<String>? columeIndex = [];
  List<List<double>>? data = [];

  Consume({this.rowIndex, this.columeIndex, this.data});

  Consume.fromJson(Map<String, dynamic> json) {
    rowIndex = json['rowIndex'] ?? [];
    columeIndex = json['columeIndex'] ?? [];
    data = json['data'] ?? [];
  }

  Map<String, double> forResident(String resident) {
    var result = <String, double>{};
    var r = rowIndex?.indexOf(resident);
    if (r != null) {
      for (var c = 0; c < (columeIndex?.length ?? 0); c++) {
        var name = columeIndex?[c];
        var value = data?[r][c];
        if (value != 0 && value != null && name != null) {
          result[name] = value;
        }
      }
    }
    return result;
  }

  Map<String, double> forProduct(String product) {
    var result = <String, double>{};
    var c = columeIndex?.indexOf(product);
    if (c != null) {
      for (var r = 0; r < (data?.length ?? 0); r++) {
        var name = rowIndex?[r];
        var value = data?[r][c];
        if (value != null && value != 0 && name != null) {
          result[name] = value;
        }
      }
    }
    return result;
  }

  double forResidentAndProduct(String resident, String product) {
    var r = rowIndex?.indexOf(resident);
    var c = columeIndex?.indexOf(product);
    if (c != null && r != null) {
      return data?[c][r] ?? 0;
    }
    return 0;
  }
}
