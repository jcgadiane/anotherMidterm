// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:midterm/models/product.dart';
import '../models/cart.dart';
import '../models/update_cart.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> getProductsByCategory(String categoryName) async {
    return http
        .get(
      Uri.parse('$baseUrl/products/category/$categoryName'),
    )
        .then((data) {
      final products = <Product>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var item in jsonData) {
          if (item['category'] == categoryName) {
            products.add(Product.fromJson(item));
          }
        }
      }
      print(data.statusCode);
      return products;
    });
  }

  Future<List<String>> getAllCategories() {
    return http.get(Uri.parse('$baseUrl/products/categories')).then((data) {
      final categories = <String>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        for (var item in jsonData) {
          categories.add(item);
        }
      }
      print(data.statusCode);
      return categories;
    });
  }

  Future updateCart(int cartId, int productId) {
    final cart = UpdateCart(userId: cartId, date: DateTime.now(), products: [
      {'productId': productId, 'quantity': 1}
    ]);
    return http
        .put(Uri.parse('$baseUrl/carts/$cartId'),
            body: json.encode(cart.toJson()))
        .then((data) {
      print(data.statusCode);
    });
  }

  Future<List<Product>> getAllProducts() async {
    return http.get(Uri.parse('$baseUrl/products')).then((data) {
      final products = <Product>[];
      print(data.statusCode);
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var product in jsonData) {
          products.add(Product.fromJson(product));
        }
      }
      return products;
    });
  }

  Future<Product> getProduct(int id) async {
    return http.get(Uri.parse('$baseUrl/products/$id')).then((data) {
      print(data.statusCode);
      Product product = Product();
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        product = Product.fromJson(jsonData);
      }
      return product;
    });
  }

  Future<Cart> getCart(String id) async {
    return http.get(Uri.parse('$baseUrl/carts/$id')).then((data) {
      print(data.statusCode);
      Cart cart = Cart();
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        cart = Cart.fromJson(jsonData);
      }
      return cart;
    });
  }

  Future deleteCart(String id) async {
    return http
        .delete(
      Uri.parse('$baseUrl/carts/$id'),
    )
        .then((data) {
      if (data.statusCode == 200) {
        print(data.statusCode);
      }
    });
  }

  Future login(String username, String password) async {
    var res = await http.post(Uri.parse('$baseUrl/auth/login'),
        body: {'username': username, 'password': password});
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      print(res.statusCode);
      print(data);
      return data;
    } else {
      print("fail");
      return null;
    }
  }
}
