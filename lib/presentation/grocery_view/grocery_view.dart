import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/constants/colors.dart';
import 'package:task/constants/common_widgets.dart';
import 'package:task/constants/routes.dart';
import 'package:task/constants/sizes.dart';
import 'package:task/controllers/grocery_controller.dart';
import 'package:task/models/user.dart';
import 'package:task/presentation/grocery_view/grocery_widgets/address_card.dart';
import 'package:task/presentation/grocery_view/grocery_widgets/deals_of_the_day.dart';
import 'package:task/presentation/grocery_view/grocery_widgets/whopper.dart';

class GoceryView extends StatefulWidget {
  const GoceryView({super.key});

  @override
  State<GoceryView> createState() => _GoceryViewState();
}

class _GoceryViewState extends State<GoceryView> {
  final searchController = TextEditingController();
  final groceryController = Get.put(ViewController());

  @override
  void initState() {
    groceryController.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarC(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH10,
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: tfColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                  child: TextFormField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Search in thousands of products',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              gapH20,
              Obx(
                () => groceryController.isLoading.value
                    ? const CircularProgressIndicator()
                    : Row(
                        children: [
                          AddressCard(
                              title: "Home Address",
                              address: cUser.homeAddress,
                              street: cUser.homeStreet),
                          gapW10,
                          AddressCard(
                              title: "Office Address",
                              address: cUser.officeAddress,
                              street: cUser.officeStreet),
                        ],
                      ),
              ),
              gapH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Explore by Category",
                    style: textStyle(15, FontWeight.bold, Colors.black),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(allProductsR,
                        arguments: groceryController.allProducts),
                    child: Text(
                      "See All",
                      style: textStyle(15, FontWeight.normal, Colors.grey),
                    ),
                  ),
                ],
              ),
              gapH20,
              Obx(
                () => groceryController.isLoading.value
                    ? const CircularProgressIndicator()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            groceryController.allProducts.length,
                            (index) => Flexible(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 56,
                                        width: 56,
                                        decoration:
                                            getDecoration(colors[index], 10),
                                      ),
                                      gapH10,
                                      Text(groceryController
                                          .categories[index].name)
                                    ],
                                  ),
                                )),
                      ),
              ),
              gapH20,
              Text(
                "Deals of the day",
                style: textStyle(15, FontWeight.bold, Colors.black),
              ),
              gapH20,
              Obx(() => groceryController.isLoading.value
                  ? const CircularProgressIndicator()
                  : DealOfTheDay(
                      dealsOfTheDay: groceryController.dealOfTheDay)),
              gapH20,
              const Whopper()
            ],
          ),
        ),
      ),
    );
  }
}
