// ignore: file_names
import 'package:anno/model/Consume.dart';

class Resident {
  String? key;
  int? capacity;
  String? image;
  String? area;
  String? display;
  String get path => "assets/image/resident/$image";

  Resident({key, capacity, image, area, display});

  Resident.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    capacity = json['capacity'];
    image = json['image'];
    area = json['area'];
    display = json['display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['capacity'] = capacity;
    data['image'] = image;
    data['area'] = area;
    data['display'] = display;
    return data;
  }
}
