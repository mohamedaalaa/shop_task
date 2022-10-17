import 'package:flutter/material.dart';
import 'package:task/models/product.dart';
import 'package:task/presentation/all_products_view.dart';

const String allProductsR = 'apr';

Route<dynamic> generateRout(RouteSettings settings) {
  switch (settings.name) {
    case allProductsR:
      var products = settings.arguments as List<Product>;
      return MaterialPageRoute(builder: (_) => AllProductsView());
    default:
      return MaterialPageRoute(builder: (_) => const ErrorWidget());
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Error Widget"),
    );
  }
}
