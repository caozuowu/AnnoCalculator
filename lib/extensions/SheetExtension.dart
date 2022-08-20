import 'package:excel/excel.dart';
import 'dart:convert';

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
    var str = value != null ? value.toString() : "";
    switch (type) {
      case "string":
        return str;
      case "int":
        return int.parse(str);
      case "double":
        return double.parse(str);
      case "string_array":
        return str.split(",");
      default:
        return str;
    }
  }
}

extension ObjectConver on Sheet {
  List<TableHeader?> _headerKeys() {
    List<TableHeader?> keys = [];
    for (var i = 0; i < rows[0].length; i++) {
      var cell = rows[0][i];
      var header = (cell == null || cell.value.toString().startsWith(":"))
          ? null
          : TableHeader(cell.value.toString());
      keys.add(header);
    }
    return keys;
  }

  List<Map<String, dynamic>> toObjectList() {
    List<Map<String, dynamic>> result = [];

    var length = rows.lastIndexWhere((row) => row[0] != null);

    if (length <= 1) {
      return result;
    }

    var headerKeys = _headerKeys();

    for (var i = 1; i < length; i++) {
      var row = rows[i];
      Map<String, dynamic> rowObject = {};

      for (var j = 0; j < row.length; j++) {
        var key = headerKeys[j];
        if (key != null) {
          key.converValue(row[j]?.value);
          var value = key.converValue(row[j]?.value);
          //print(value);
          rowObject[key.name] = value;
        }
      }
      result.add(rowObject);
    }

    return result;
  }
}
