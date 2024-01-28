class PostModel {
  String? id;
  List<String>? images;
  String? brand;
  String? year;
  String? model;
  String? bodyType;
  String? cylinders;
  String? engineCapacity;
  String? fuelType;
  String? transmissionType;
  String? color;
  String? kilometers;
  String? price;
  String? location;
  String? description;
  String? ownerName;
  String? ownerMobile;
  DateTime? time;

  PostModel(
      {this.id,
      this.images,
      this.brand,
      this.year,
      this.model,
      this.bodyType,
      this.cylinders,
      this.engineCapacity,
      this.fuelType,
      this.transmissionType,
      this.color,
      this.kilometers,
      this.price,
      this.location,
      this.description,
      this.ownerName,
      this.ownerMobile,
      this.time});

  factory PostModel.fromMap(String postId, Map<String, dynamic>? snapshot) {
    return PostModel(
        id: postId,
        images: snapshot!['images'],
        brand: snapshot!['brand'],
        year: snapshot!['year'],
        bodyType: snapshot!['body type'],
        model: snapshot!['model'],
        cylinders: snapshot!['cylinders'],
        engineCapacity: snapshot!['engine capacity'],
        fuelType: snapshot!['fuel type'],
        transmissionType: snapshot!['transmission type'],
        color: snapshot!['color'],
        kilometers: snapshot!['kilometers'],
        price: snapshot!['price'],
        location: snapshot!['location'],
        description: snapshot!['description'],
        ownerName: snapshot!['owner name'],
        ownerMobile: snapshot!['owner mobile'],
        time: snapshot['date']);
  }

  Map<String, dynamic> toMap() {
    return {
      'brand': brand,
      'images': images,
      'year': year,
      'body type': bodyType,
      'model': model,
      'cylinders': cylinders,
      'engine capacity': engineCapacity,
      'fuel type': fuelType,
      'transmission type': transmissionType,
      'color': color,
      'kilometers': kilometers,
      'price': price,
      'location': location,
      'description': description,
      'owner name': ownerName,
      'owner mobile': ownerMobile,
      'date': time
    };
  }
}
