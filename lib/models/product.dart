class Product {
  String id;
  String title;
  String price;
  String description;
  String category;
  String image;

  Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
  }
}
