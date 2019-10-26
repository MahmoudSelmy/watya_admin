class Product{
  String id;
  double price;
  double basePrice;
  String name;
  List<String> images;
  List<int> availableSizes;
  String brandId;
  String details;
  String style;
  String material;
  String applicableSeason;
  List<String> availableColors;
  int purchases;
  int uploadTimestamp;

  Product({this.id, this.price, this.basePrice, this.name, this.images, this.availableSizes, this.brandId,
    this.details, this.style, this.material, this.applicableSeason, this.availableColors, this.purchases, this.uploadTimestamp});

  Product.fromMap(Map snapshot, String id) :
        id = id ?? '',
        price = snapshot['price'] * 1.0 ?? 0.0,
        basePrice = snapshot['basePrice'] * 1.0 ?? 0.0,
        name = snapshot['name'] ?? '',
        images = List<String>.from(snapshot['images']) ?? <String>[],
        availableSizes = List<int>.from(snapshot['availableSizes']) ?? <int>[],
        brandId = snapshot['brandId'] ?? '',
        details = snapshot['details'] ?? '',
        style = snapshot['style'] ?? '',
        material = snapshot['material'] ?? '',
        applicableSeason = snapshot['applicableSeason'] ?? '',
        availableColors = List<String>.from(snapshot['availableColors']) ?? <String>[],
        purchases = snapshot['purchases'] ?? 0,
        uploadTimestamp = snapshot['uploadTimestamp'] ?? DateTime.now().millisecondsSinceEpoch;

  toJson() {
    return {
      "price": price,
      "basePrice": basePrice,
      "name": name,
      "images": images,
      "availableSizes": availableSizes,
      "brandId": brandId,
      "details": details,
      "style": style,
      "material": material,
      "applicableSeason": applicableSeason,
      "availableColors": availableColors,
      "purchases" : purchases,
      "uploadTimestamp" : uploadTimestamp
    };
  }
}