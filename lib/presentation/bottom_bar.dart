import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/constants/colors.dart';
import 'package:task/constants/common_widgets.dart';
import 'package:task/constants/images.dart';
import 'package:task/controllers/cart_controller.dart';
import 'package:task/presentation/cart_view/cart_view.dart';
import 'package:task/presentation/favorite_view/favorite_view.dart';
import 'package:task/presentation/grocery_view/grocery_view.dart';
import 'package:task/presentation/news_view/news_view.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  final controller = Get.put(CartController());

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _page,
          children: [
            const GoceryView(),
            const NewsView(),
            FavoriteView(),
            const CartView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: updatePage,
          currentIndex: _page,
          selectedItemColor: fabColor,
          unselectedItemColor: unSelectedItemColor,
          backgroundColor: bottomBarColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Grocery',
            ),
            // ACCOUNT
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: 'News',
            ),

            // CART
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Cart',
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: fabColor,
          child: Center(
              child: Stack(
            children: [
              Image.asset(
                basket,
                color: Colors.white,
              ),
              GetBuilder(
                init: CartController(),
                builder: (controller) {
                  return Positioned(
                      left: 5,
                      right: 5,
                      top: 5,
                      bottom: 5,
                      child: Text(
                        "${controller.totalPrice}",
                        style: textStyle(10, FontWeight.bold, Colors.white),
                      ));
                },
              )
            ],
          )),
        ));
  }
}
/*
Text("50",style: textStyle(size, fontWeight, color),),
                Image.asset(
                  basket,
                  color: Colors.white,
                ),*/