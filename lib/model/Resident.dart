// ignore: file_names
import 'package:anno/model/Consume.dart';

class Resident {
  String? key;
  int? capacity;
  String? image;
  String? area;
  String? display;
  List<String> necessity = [];
  List<String> luxary = [];
  List<String> skyscraper = [];
  String get path => "assets/image/resident/$image";

  int amount = 0;

  Resident({key, capacity, image, area, display});

  Resident.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    capacity = json['capacity'];
    image = json['image'];
    area = json['area'];
    display = json['display'];
    necessity = List<String>.from(json['necessity'] ?? []);
    luxary =  List<String>.from(json['luxary'] ?? []);
    skyscraper = List<String>.from(json['skyscraper'] ?? []);
  }
}
