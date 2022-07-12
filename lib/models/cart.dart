class Cart {
  num? id;
  num? userId;
  DateTime? date;
  List? products;

  Cart({
    this.id,
    this.userId,
    this.date,
    this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      products: json['products'],
    );
  }
}
