class Product {
  num? id;
  String? title;
  num? price;
  String? category;
  String? description;
  String? image;

  Product({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> product) {
    return Product(
      id: product['id'],
      title: product['title'],
      price: product['price'],
      category: product['category'],
      description: product['description'],
      image: product['image'],
    );
  }
}
