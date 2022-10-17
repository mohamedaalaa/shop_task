import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/constants/colors.dart';
import 'package:task/constants/common_widgets.dart';
import 'package:task/controllers/grocery_controller.dart';
import 'package:task/models/product.dart';

import '../../../constants/sizes.dart';

class DealOfTheDay extends StatelessWidget {
  List<Product> dealsOfTheDay;
  DealOfTheDay({super.key, required this.dealsOfTheDay});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ViewController(),
      builder: (controller) {
        return SizedBox(
          height: 90,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: dealsOfTheDay.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: getDecoration(dealsColors[0], 10),
                      ),
                      Positioned(
                          top: -5,
                          left: -5,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                            child: Center(
                              child: IconButton(
                                  onPressed: () => controller
                                      .toggleFavStatus(dealsOfTheDay[index].id),
                                  padding: EdgeInsets.zero,
                                  iconSize: 10,
                                  icon: Icon(
                                    dealsOfTheDay[index].isFav
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                  )),
                            ),
                          ))
                    ],
                  ),
                  gapW10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dealsOfTheDay[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Pieces ${dealsOfTheDay[index].name}",
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.location_on_outlined),
                          gapW10,
                          Text(
                            "15 Minutes Away",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Text("\$ 12  \$ 17",
                          style:
                              textStyle(15, FontWeight.normal, Colors.black)),
                    ],
                  )
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return gapW10;
            },
          ),
        );
      },
    );
  }
}
