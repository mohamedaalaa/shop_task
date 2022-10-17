import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/constants/colors.dart';
import 'package:task/constants/common_widgets.dart';
import 'package:task/controllers/cart_controller.dart';
import 'package:task/controllers/grocery_controller.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({super.key});

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favorite Products"),
        ),
        body: GetBuilder(
            init: ViewController(),
            builder: (controller) {
              return controller.getFavProduts.isEmpty
                  ? const Center(
                      child: Text("No fav yet"),
                    )
                  : ListView.builder(
                      itemCount: controller.getFavProduts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            height: 60,
                            width: 60,
                            decoration: getDecoration(colors[index], 5),
                          ),
                          title: Text(controller.getFavProduts[index].name),
                          subtitle: Text(
                              "Pieces ${controller.getFavProduts[index].name}"),
                          trailing: IconButton(
                              onPressed: () {
                                cartController.addProduct(
                                    controller.getFavProduts[index]);
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.black,
                              )),
                        );
                      },
                    );
            }));
  }
  //  controller.favProducts.isEmpty
  //     ? const Center(
  //         child: Text("No fav yet"),
  //       )
  //     : Obx(
  //         () => controller.isFav.value
  //             ? const Center(
  //                 child: CircularProgressIndicator(),
  //               )
  //             : ListView.builder(
  //                 itemCount: controller.favProducts.length,
  //                 itemBuilder: (context, index) {
  //                   return controller.isFav.value
  //                       ? const Center(child: CircularProgressIndicator())
  //                       : ListTile(
  //                           leading: Container(
  //                             height: 60,
  //                             width: 60,
  //                             decoration: getDecoration(colors[index], 5),
  //                           ),
  //                           title:
  //                               Text(controller.favProducts[index].name),
  //                           subtitle: Text(
  //                               "Pieces ${controller.favProducts[index].name}"),
  //                           trailing: IconButton(
  //                               onPressed: () =>
  //                                   controller.toggleFavStatus(
  //                                       controller.favProducts[index].id),
  //                               icon: const Icon(
  //                                 Icons.favorite,
  //                                 color: Colors.red,
  //                               )),
  //                         );
  //                 },
  //               ),
  //       ));

}
