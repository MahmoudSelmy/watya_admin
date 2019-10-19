class Product{
  String id;
  int price;
  int basePrice;
  String name;
  List<String> images;
  List<int> availableSizes;
  String brandId;
  String details;
  String style;
  String material;
  String applicableSeason;
  List<String> availableColors;

  Product({this.id, this.price, this.basePrice, this.name, this.images, this.availableSizes, this.brandId,
    this.details, this.style, this.material, this.applicableSeason, this.availableColors});

  Product.fromMap(Map<String, dynamic> snapshot, String id) :
        id = id ?? '',
        price = snapshot['price'] ?? '',
        basePrice = snapshot['basePrice'] ?? '',
        name = snapshot['name'] ?? '',
        images = snapshot['images'] ?? [],
        availableSizes = snapshot['availableSizes'] ?? [],
        brandId = snapshot['brandId'] ?? '',
        details = snapshot['details'] ?? '',
        style = snapshot['style'] ?? '',
        material = snapshot['material'] ?? '',
        applicableSeason = snapshot['applicableSeason'] ?? '',
        availableColors = snapshot['availableColors'] ?? [];

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
    };
  }
}