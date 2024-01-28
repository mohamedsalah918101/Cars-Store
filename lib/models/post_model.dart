class PostModel {
  String? id;
  List<String>? images;
  String? brand;
  int? year;
  String? model;
  int? cylinders;
  int? engineCapcity;
  String? fuelType;
  String? transmissionType;
  String? color;
  double? kilometers;
  double? price;
  String? ownerName;
  String? ownerMobile;
  DateTime? dateTime;

  PostModel(
      {this.id,
      this.images,
      this.brand,
      this.year,
      this.model,
      this.cylinders,
      this.engineCapcity,
      this.fuelType,
      this.transmissionType,
      this.color,
      this.kilometers,
      this.price,
      this.ownerName,
      this.ownerMobile,
      this.dateTime});

  factory PostModel.fromMap(String postId, Map<String, dynamic>? snapshot) {
    return PostModel(
        id: postId,
        images: snapshot!['images'],
        brand: snapshot!['brand'],
        year: snapshot!['year'],
        model: snapshot!['model'],
        cylinders: snapshot!['cylinders'],
        engineCapcity: snapshot!['engine capcity'],
        fuelType: snapshot!['fuel type'],
        transmissionType: snapshot!['transmission type'],
        color: snapshot!['color'],
        kilometers: snapshot!['kilometers'],
        price: snapshot!['price'],
        ownerName: snapshot!['owner name'],
        ownerMobile: snapshot!['owner mobile'],
        dateTime: snapshot['date']);
  }

  Map<String, dynamic> toMap() {
    return {
      'brand': brand,
      'year': year,
      'model': model,
      'cylinders': cylinders,
      'engine capcity': engineCapcity,
      'fuel type': fuelType,
      'transmission type': transmissionType,
      'color': color,
      'kilometers': kilometers,
      'price': price,
      'owner name': ownerName,
      'owner mobile': ownerMobile,
      'date': dateTime
    };
  }
}
