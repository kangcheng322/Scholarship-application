import 'package:flutter/material.dart';
import 'package:aplicacion_becas/widget/drawer.dart';
import 'package:aplicacion_becas/widget/app_bar.dart';
import 'package:aplicacion_becas/widget/card.dart';
import 'package:aplicacion_becas/model/scholarship.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            drawer: drawer(context, size),
            appBar: appBar(size),
            body: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return card(size, data[index]);
                })));
  }
}
