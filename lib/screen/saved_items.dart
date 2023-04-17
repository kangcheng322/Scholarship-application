import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/save_items_controller.dart';
import '../widget/card.dart';
import '../widget/app_bar2.dart';

class SavedItems extends StatelessWidget {
  const SavedItems({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: appBar2(size, context, 1),
        body: GetBuilder<SaveItemsController>(
            // specify type as Controller
            init: SaveItemsController(), // intialize with the Controller
            builder: (value) {
              if (value.elements.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Maleta vacia.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 20), // Espacio entre la imagen y el texto
                    const Text(
                      '¡No tienes becas guardadas!',
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: value.elements.length,
                    itemBuilder: (BuildContext context, int index) {
                      return card(size, value.elements[index]);
                    });
              }
            }),
      ),
    );
  }
}
