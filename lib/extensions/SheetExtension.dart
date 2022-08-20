import 'dart:ffi';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

class TableHeader {
  String name = "";
  String type = "";

  TableHeader(String str) {
    var arr = str.split(":");
    name = arr[0].toString();
    type = arr[1].toString();
  }

  dynamic converValue(dynamic value) {
    switch (type) {
      case "string":
        return value.toString();
      case "int":
        return int.parse(value);
      case "double":
        return double.parse(value);
      case "string_array":
        return value.toString().split(",");
      default:
        return value.toString();
    }
  }
}

extension Void on dynamic {
  dynamic _converBy(TableHeader header) {
    switch (header.type) {
      case "string":
        return toString();
      case "int":
        return int.parse(this);
      case "double":
        return double.parse(this);
      case "string_array":
        return toString().split(",");
      default:
        return toString();
    }
  }
}

extension Viod on Sheet {
  List<Map<String, dynamic>> mapList() {
    List<Map<String, dynamic>> result = [];
    var length = rows.indexWhere((row) => row[0] == null);

    if (length <= 1) {
      return result;
    }

    List<TableHeader?> keys = [];
    for (var i = 0; i < rows[0].length; i++) {
      var cell = rows[0][i];
      var header = (cell == null || cell.value.toString().startsWith(":"))
          ? null
          : TableHeader(cell.value.toString());
      keys.add(header);
    }

    for (var i = 1; i < length; i++) {
      var row = rows[i];
      Map dic = {};
      for (var j = 0; j < row.length; j++) {
        if (keys[j] != null) {
          var type = keys[j];
          // row[j]._converBy(keys[j]);
          // type.type;
        }
      }
      //   result.add(dic);
    }

    //print(result);
    return result;
  }
}
