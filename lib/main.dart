import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/constants/routes.dart';
import 'package:task/presentation/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      onGenerateRoute: generateRout,
      home: const BottomBar(),
    );
  }
}
