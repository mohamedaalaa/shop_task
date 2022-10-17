import 'package:get/get.dart';
import 'package:task/models/category.dart';
import 'package:task/models/product.dart';
import 'package:task/services/grocery_services.dart';

class ViewController extends GetxController {
  var isLoading = false.obs;
  var isFav = false.obs;
  List<Product> allProducts = [];
  List<Category> categories = [];
  List<Product> dealOfTheDay = [];
  List<Product> cartProduct = [];
  // RxList<Product> favProducts = RxList<Product>();

  Future getProducts() async {
    try {
      isLoading(true);
      categories = await GroceryServices().getProducts();
      for (var category in categories) {
        for (var product in category.products) {
          allProducts.add(product);
        }
      }
      dealOfTheDay =
          allProducts.where((product) => product.discount != null).toList();
    } finally {
      isLoading(false);
    }
  }

  void toggleFavStatus(int id) {
    allProducts[id].isFav = !allProducts[id].isFav;
    update();
  }

  List<Product> get getFavProduts {
    return allProducts.where((element) => element.isFav == true).toList();
  }

  List<Product> get getCartProduts {
    return cartProduct;
  }

  // void removeFavProduct(Product product) {
  //   isFav(true);
  //   product.isFav = !product.isFav;
  //   favProducts.remove(product);
  //   isFav(false);
  // }

  // Future getUser() async {
  //   try {
  //     isLoadingU(true);
  //     cUser = await GroceryServices().getUserData();
  //     print(cUser);
  //   } finally {
  //     isLoadingU(false);
  //   }
  // }

  // Future getDealOftheDay() async {
  //   try {
  //     isLoadingDeals(true);
  //     dealOfTheDay = await GroceryServices().getDealOfTheDay();
  //     dealOfTheDayC = [
  //       Category(
  //           color: fdColor,
  //           products: dealOfTheDay
  //               .where((product) => product.type == "DealOfTheDay")
  //               .toList(),
  //           name: 'DealOfTheDay'),
  //     ];
  //   } finally {
  //     isLoadingDeals(true);
  //   }
  // }
}
