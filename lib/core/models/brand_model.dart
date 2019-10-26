class Brand{
  String id;
  String name;
  String image;
  int purchases;

  Brand({this.id, this.name, this.image, this.purchases});

  Brand.fromMap(Map snapshot, String id) :
        id = id ?? '',
        name = snapshot['name'] ?? '',
        image = snapshot['image'] ?? '',
        purchases = snapshot['purchases'] ?? 0;

  toJson() {
    return {
      "name": name,
      "image": image,
      'purchases': purchases,
    };
  }
}