import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:task/constants/images.dart';
import 'package:task/models/category.dart';
import 'package:task/models/product.dart';
import 'package:task/models/user.dart';

class GroceryServices {
  Future<List<Category>> getProducts() async {
    var response = await rootBundle.loadString(recipe);
    final data = await jsonDecode(response);
    print(data);
    List<Category> categories =
        List<Category>.from(data["categories"].map((x) => Category.fromMap(x)));
    cUser = User.fromMap(data["user"]);
    print(cUser);
    return categories;
  }
}
