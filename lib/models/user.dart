// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:task/models/product.dart';

class User {
  final String name;
  final String homeAddress;
  final String homeStreet;
  final String officeAddress;
  final String officeStreet;
  List<Product> favProducts = [];
  final List<Product> cart = [];

  User({
    required this.name,
    required this.homeAddress,
    required this.homeStreet,
    required this.officeAddress,
    required this.officeStreet,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'homeAddress': homeAddress,
      'homeStreet': homeStreet,
      'officeAddress': officeAddress,
      'officeStreet': officeStreet,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      homeAddress: map['home address'] as String,
      homeStreet: map['home street'] as String,
      officeAddress: map['office address'] as String,
      officeStreet: map['office street'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}

User cUser = User(
    name: "",
    homeAddress: "",
    homeStreet: "",
    officeAddress: "",
    officeStreet: "");
