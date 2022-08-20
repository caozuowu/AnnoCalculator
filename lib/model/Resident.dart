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
    data['name'] = name;
    data['capacity'] = capacity;
    data['consume'] = consume;
    data['image'] = image;
    return data;
  }
}
