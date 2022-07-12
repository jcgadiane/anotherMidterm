class UpdateCart {
  num? userId;
  DateTime? date;
  List? products;

  UpdateCart({
    this.userId,
    this.date,
    this.products,
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "date": date == null ? null : date!.toIso8601String(),
      "products": products,
    };
  }

  factory UpdateCart.fromJson(Map<String, dynamic> json) {
    return UpdateCart(
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      products: json['products'],
    );
  }
}
