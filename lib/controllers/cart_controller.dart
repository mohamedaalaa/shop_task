import 'package:get/get.dart';
import 'package:task/models/product.dart';

class CartController extends GetxController {
  List<Product> cart = [];
  int totalPrice = 0;

  int calculateTotalPrice() {
    return cart.isEmpty
        ? 0
        : int.parse(cart.fold(
            "0", (previousValue, element) => previousValue + element.price));
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
