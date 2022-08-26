class Product {
  String? key;
  int? time;
  String? image;
  String? name;
  int? base;
  bool? ect;
  List<String>? material;

  Product(
      {this.key,
      this.time,
      this.image,
      this.name,
      this.base,
      this.ect,
      this.material});

  Product.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    time = json['time'];
    image = json['image'];
    name = json['name'];
    base = json['base'];
    ect = json['ect'];
    material = json['material'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['time'] = this.time;
    data['image'] = this.image;
    data['name'] = this.name;
    data['base'] = this.base;
    data['ect'] = this.ect;
    data['material'] = this.material;
    return data;
  }
}