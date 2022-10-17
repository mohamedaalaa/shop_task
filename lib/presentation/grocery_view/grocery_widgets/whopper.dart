import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/constants/common_widgets.dart';
import 'package:task/constants/device_size.dart';
import 'package:task/constants/sizes.dart';

class Whopper extends StatelessWidget {
  const Whopper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 131,
      decoration: getDecoration(wColor, 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mega",
              style: textStyle(10, FontWeight.normal, const Color(0xFFD03A27)),
            ),
            Text(
              "WHOPPER",
              style: textStyle(30, FontWeight.normal, const Color(0xFF21114B)),
            ),
            Row(
              children: [
                Text("\$ 17",
                    style: textStyle(
                        15, FontWeight.bold, const Color(0xFFEE6A61))),
                gapW20,
                Stack(
                  children: [
                    Text("\$ 12",
                        style: textStyle(15, FontWeight.normal, Colors.white)),
                    const Positioned(
                        child: Divider(
                      thickness: 1,
                      color: Colors.white,
                    ))
                  ],
                ),
              ],
            ),
            Text("* Available until 24 December 2020",
                style: textStyle(10, FontWeight.normal, Colors.white))
          ],
        ),
      ),
    );
  }
}
