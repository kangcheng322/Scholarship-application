import 'package:aplicacion_becas/screen/filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appBar(size) {
  return AppBar(
    elevation: 10,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.menu,
            size: 40,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    ),
    centerTitle: true,
    title: Image.asset(
      'assets/BECAS PARA TODOS.png',
      height: size.height * 0.07,
      width: size.width * 0.35,
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(
          Icons.filter_list_rounded,
          size: 40,
        ),
        onPressed: () {
          Get.to(() => const MyFilter());
        },
      ), //Ic
      IconButton(
        icon: const Icon(
          Icons.search,
          size: 40,
        ),
        onPressed: () {},
      ), //IconButton
    ], //<Widget>[]
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
}
