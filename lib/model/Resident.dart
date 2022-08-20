//type	capacity	consume	image

import 'package:flutter/material.dart';

class Resident {
  String? name;
  int? capacity;
  List<String>? consume;
  String? image;

  Resident({this.name, this.capacity, this.consume, this.image});

  Resident.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    capacity = json['capacity'];
    consume = json['consume'].cast<String>();
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['capacity'] = this.capacity;
    data['consume'] = this.consume;
    data['image'] = this.image;
    return data;
  }
}


/*
class Spacecraft {
  String name;
  DateTime launchDate;

  // 构造函数，使用语法糖设置成员变量。
  Spacecraft(this.name, this.launchDate) {
    // 这里编写初始化代码。
  }

  // 命名构造函数，最终调用默认构造函数。
  Spacecraft.unlaunched(String name) : this(name, null);

  int get launchYear =>
      launchDate?.year; // read-only non-final 属性

  // 方法。
  void describe() {
    print('Spacecraft: $name');
    if (launchDate != null) {
      int years =
          DateTime.now().difference(launchDate).inDays ~/
              365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}
*/