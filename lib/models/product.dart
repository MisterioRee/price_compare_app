import 'dart:convert';

class Product {
  String? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;
  bool isLiked = false;

  Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.isLiked = false});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    isLiked = json['isLiked'] ?? false;
  }
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
      };

  Product productFromJson(String str) {
    final jsonData = json.decode(str);
    return Product.fromJson(jsonData);
  }

  String productToJson(Product data) {
    final dyn = data.toMap();
    return json.encode(dyn);
  }
}
