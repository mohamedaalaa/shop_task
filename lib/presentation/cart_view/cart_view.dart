import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/constants/common_widgets.dart';
import 'package:task/constants/sizes.dart';
import 'package:task/controllers/cart_controller.dart';
import '../../constants/colors.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: GetBuilder(
          init: CartController(),
          builder: (controller) {
            return controller.getCartProducts.isEmpty
                ? const Center(
                    child: Text("add some products to cart"),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                              leading: Container(
                                height: 60,
                                width: 60,
                                decoration: getDecoration(colors[index], 5),
                              ),
                              title:
                                  Text(controller.getCartProducts[index].name),
                              subtitle: Text(
                                  "Price for one piece ${controller.getCartProducts[index].price}"),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: GestureDetector(
                                        onTap: () => controller.addProduct(
                                            controller.getCartProducts[index]),
                                        child: Container(
                                          width: 33,
                                          height: 33,
                                          decoration: getDecoration(aPColor, 5),
                                          child: Icon(
                                            Icons.add,
                                            color: iColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    gapW10,
                                    Flexible(
                                        child: Text(
                                            "${controller.getCartProducts[index].quantity}")),
                                    gapW10,
                                    Flexible(
                                      child: GestureDetector(
                                        onTap: () => controller.removeProduct(
                                            controller.getCartProducts[index]),
                                        child: Container(
                                          width: 33,
                                          height: 33,
                                          decoration: getDecoration(aPColor, 5),
                                          child: Icon(
                                            Icons.remove,
                                            color: iColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return gapH10;
                        },
                        itemCount: controller.getCartProducts.length),
                  );
          },
        ));
  }
}
