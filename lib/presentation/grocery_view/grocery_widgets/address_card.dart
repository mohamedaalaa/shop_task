import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/constants/sizes.dart';

import '../../../constants/common_widgets.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String address;
  final String street;
  const AddressCard(
      {super.key,
      required this.title,
      required this.address,
      required this.street});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        height: 80,
        // width: context.width * .4,
        decoration: getDecoration(Colors.white, 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 60,
                decoration: getDecoration(cColor, 10),
              ),
              gapW15,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: textStyle(12, FontWeight.bold, Colors.black)),
                  Text(
                    address,
                    style: textStyle(10, FontWeight.normal, Colors.grey),
                  ),
                  Text(street,
                      style: textStyle(10, FontWeight.normal, Colors.grey)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
