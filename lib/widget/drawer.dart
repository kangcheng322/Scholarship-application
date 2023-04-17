import 'package:aplicacion_becas/screen/saved_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Drawer drawer(context, size) {
  return Drawer(
    child: ListView(
      //padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(
          height: size.height * 0.300,
          child: DrawerHeader(
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(
                      -9.0,
                      2.0,
                    ),
                    blurRadius: 5.0,
                    spreadRadius: 3.0,
                  ), //BoxShadow
                ],
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF6A1B9A),
                image: const DecorationImage(
                    image: AssetImage("assets/BECAS PARA TODOS.png"),
                    fit: BoxFit.contain)),
            child: const Text(''),
          ),
        ),
        Divider(
          height: size.height * 0.05,
          color: Colors.transparent,
        ),
        Card(
          elevation: 10,
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            leading: const Icon(
              Icons.bookmark,
              color: Color(0xFF6A1B9A),
              size: 30.0,
            ),
            title: const Text(
              'Elementos guardados',
              style: TextStyle(
                color: Color(0xFF6A1B9A),
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward,
              color: Color(0xFF6A1B9A),
            ),
            onTap: () {
              Get.to(() => const SavedItems());
            },
          ),
        ),
        const Divider(
          height: 20,
          color: Colors.transparent,
        ),
        Card(
          elevation: 10,
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            leading: const Icon(
              Icons.star,
              color: Color(0xFF6A1B9A),
              size: 30.0,
            ),
            title: const Text(
              'Valorar app',
              style: TextStyle(
                color: Color(0xFF6A1B9A),
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward,
              color: Color(0xFF6A1B9A),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        const Divider(
          height: 20,
          color: Colors.transparent,
        ),
        Card(
          elevation: 10,
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            leading: const Icon(
              Icons.contact_mail,
              color: Color(0xFF6A1B9A),
              size: 30.0,
            ),
            title: const Text(
              'Contáctanos',
              style: TextStyle(
                color: Color(0xFF6A1B9A),
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward,
              color: Color(0xFF6A1B9A),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    ),
  );
}
