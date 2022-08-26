class Resident {
	String? key;
	int? capacity;
	String? image;
	String? area;
	String? display;
	Consume? consume;

	Resident({this.key, this.capacity, this.image, this.area, this.display, this.consume});

	Resident.fromJson(Map<String, dynamic> json) {
		key = json['key'];
		capacity = json['capacity'];
		image = json['image'];
		area = json['area'];
		display = json['display'];
		consume = json['consume'] != null ? new Consume.fromJson(json['consume']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['key'] = this.key;
		data['capacity'] = this.capacity;
		data['image'] = this.image;
		data['area'] = this.area;
		data['display'] = this.display;
		if (this.consume != null) {
      data['consume'] = this.consume!.toJson();
    }
		return data;
	}
}

class Consume {

	Consume();

	Consume.fromJson(Map<String, dynamic> json) {
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		return data;
	}
}