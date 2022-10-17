import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/constants/colors.dart';
import 'package:task/constants/common_widgets.dart';
import 'package:task/constants/sizes.dart';
import 'package:task/controllers/grocery_controller.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
      ),
      body: GetBuilder(
        builder: (ViewController controller) {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: getDecoration(colors[index], 5),
                  ),
                  title: Text(controller.allProducts[index].name),
                  subtitle:
                      Text("Pieces ${controller.allProducts[index].name}"),
                  trailing: SizedBox(
                    child: IconButton(
                        onPressed: () => controller
                            .toggleFavStatus(controller.allProducts[index].id),
                        icon: Icon(
                          controller.allProducts[index].isFav
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        )),
                  ));
            },
            itemCount: controller.allProducts.length,
            separatorBuilder: (BuildContext context, int index) {
              return gapH10;
            },
          );
        },
      ),
    );
  }
}
