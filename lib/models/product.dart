// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final int id;
  final String name;
  int quantity;
  final String price;
  final String? discount;
  bool isFav = false;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    this.isFav = false,
    this.discount,
  });

  // static final List<Product> _products = [
  //   Product(name: "Salamon", quantity: 1, price: 30, type: "Fish"),
  //   Product(name: "Carrot", quantity: 1, price: 15, type: "Vegetables"),
  //   Product(name: "Cocacola", quantity: 30, price: 10, type: "Beverages"),
  //   Product(name: "Meat", quantity: 1, price: 30, type: "Stick"),
  //   Product(name: "Orange Juice", quantity: 1, price: 30, type: "Juice"),
  // ];

  // static List<Product> get allProducts {
  //   return _products;
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'quantity': quantity,
      'price': price,
      'discount': discount,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as String,
      discount: map['discount'] != null ? map['discount'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
