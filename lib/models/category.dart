import 'dart:convert';
import 'package:task/models/product.dart';

class Category {
  final String name;
  List<Product> products;
  Category({
    required this.products,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['type'] as String,
      products: List<Product>.from(
        (map['products'] as List<dynamic>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());
}
