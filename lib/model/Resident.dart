// ignore: file_names
class Resident {
  String? key;
  int? capacity;
  String? image;
  String? area;
  String? display;
  Consume? consume;

  String get path => "assets/image/resident/$image";

  Resident({key, capacity, image, area, display, consume});

  Resident.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    capacity = json['capacity'];
    image = json['image'];
    area = json['area'];
    display = json['display'];
    consume =
        json['consume'] != null ? Consume.fromJson(json['consume']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['capacity'] = capacity;
    data['image'] = image;
    data['area'] = area;
    data['display'] = display;
    if (consume != null) {
      data['consume'] = consume!.toJson();
    }
    return data;
  }
}

class Consume {
  Consume();

  Consume.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
