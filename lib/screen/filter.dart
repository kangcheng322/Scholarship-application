import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/filter_controller.dart';
import '../widget/app_bar2.dart';

class MyFilter extends StatelessWidget {
  const MyFilter({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: appBar2(size, context, 2),
          body: GetBuilder<FilterController>(
            init: FilterController(),
            builder: (v) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const ListTile(
                      title: Text(
                        'Filtrar por nivel',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFF6A1B9A)),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: CheckboxListTile(
                        title: const Text('Pregrado'),
                        value: v.levels[0], //_levels[index - 1],
                        checkboxShape: const CircleBorder(),
                        onChanged: (value) {
                          v.selectedLevel(0);
                        },
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: CheckboxListTile(
                        title: const Text('Postgrado'),
                        value: v.levels[1], //_levels[index - 1],
                        checkboxShape: const CircleBorder(),
                        onChanged: (value) {
                          v.selectedLevel(1);
                        },
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: CheckboxListTile(
                        title: const Text('Maestría'),
                        value: v.levels[2], //_levels[index - 1],
                        checkboxShape: const CircleBorder(),
                        onChanged: (value) {
                          v.selectedLevel(2);
                        },
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: CheckboxListTile(
                        title: const Text('Doctorado'),
                        value: v.levels[3], //_levels[index - 1],
                        checkboxShape: const CircleBorder(),
                        onChanged: (value) {
                          v.selectedLevel(3);
                        },
                      ),
                    ),
                    const ListTile(
                      title: Text(
                        'Filtrar por modalidad',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFF6A1B9A)),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: CheckboxListTile(
                        title: const Text('Presencial'),
                        value: v.modalitys[0], //_levels[index - 1],
                        checkboxShape: const CircleBorder(),
                        onChanged: (value) {
                          v.selectedModality(0);
                        },
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: CheckboxListTile(
                        title: const Text('Virtual'),
                        value: v.modalitys[1], //_levels[index - 1],
                        checkboxShape: const CircleBorder(),
                        onChanged: (value) {
                          v.selectedModality(1);
                        },
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: CheckboxListTile(
                        title: const Text('Híbrida'),
                        value: v.modalitys[2], //_levels[index - 1],
                        checkboxShape: const CircleBorder(),
                        onChanged: (value) {
                          v.selectedModality(2);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: v.isButtonEnabled ? () => print('hola') : null,
                      style: ElevatedButton.styleFrom(
                        elevation: 10, // Ajusta la elevación de la sombra
                        shadowColor:
                            Colors.black, // Cambia el color de la sombra
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Ajusta la forma del botón
                        ),
                      ),
                      child: const Text('Aplicar'),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
