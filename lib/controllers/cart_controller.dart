import 'package:get/get.dart';
import 'package:task/models/product.dart';

class CartController extends GetxController {
  List<Product> cart = [];
  int totalPrice = 0;

  void calculateTotalPrice() {
    if (cart.isEmpty) {
      totalPrice = 0;
    } else {
      for (var product in cart) {
        totalPrice += int.parse(product.price);
      }
    }
    update();
  }

  List<Product> get getCartProducts {
    return cart;
  }

  void addProduct(Product product) {
    if (cart.contains(product)) {
      product.quantity++;
    } else {
      cart.add(product);
    }
    calculateTotalPrice();
    update();
  }

  void removeProduct(Product product) {
    if (product.quantity == 1) {
      cart.remove(product);
    } else {
      product.quantity--;
    }
    calculateTotalPrice();
    update();
  }
}
