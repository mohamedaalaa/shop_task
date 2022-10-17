import 'package:flutter/material.dart';
import 'package:task/presentation/all_products_view.dart';

const String allProductsR = 'apr';

Route<dynamic> generateRout(RouteSettings settings) {
  switch (settings.name) {
    case allProductsR:
      return MaterialPageRoute(builder: (_) => const AllProductsView());
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
