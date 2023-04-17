import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/home.dart';

AppBar appBar2(size, context, option) {
  return AppBar(
    elevation: 10,
    leading: IconButton(
      onPressed: () {
        option == 1 ? Get.to(() => const MyHomePage()) : Get.back();
      },
      icon: const Icon(Icons.arrow_back, size: 40),
    ),
    centerTitle: true,
    title: Image.asset(
      'assets/BECAS PARA TODOS.png',
      height: size.height * 0.07,
      width: size.width * 0.35,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
}
