import 'package:aplicacion_becas/controller/save_items_controller.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:url_launcher/url_launcher.dart';
import '../database/db.dart';

Widget card(size, element) {
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(element['enlace']),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ${Uri.parse(element['enlace'])}');
    }
  }

  return ExpandableNotifier(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        shadowColor: Colors.grey,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Ink(
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  image: DecorationImage(
                    image: AssetImage(element['imagen']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    _launchUrl();
                  },
                  splashColor: const Color(0xFF6A1B9A),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: size.width * 0.07,
                                height: size.height * 0.04,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: const Color(0xFF6A1B9A)),
                                  // shape: BoxShape.circle,
                                ),
                              ),
                              Positioned(
                                child: PopupMenuButton(
                                    icon: const Icon(Icons.more_vert,
                                        color: Color(0xFF6A1B9A)),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    )),
                                    itemBuilder: (context) {
                                      return [
                                        if (element['bd'] == 'F')
                                          PopupMenuItem<int>(
                                              value: 0,
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.bookmark_add,
                                                    color: Color(0xFF6A1B9A),
                                                  ),
                                                  Text(
                                                    " Guardar",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF6A1B9A)),
                                                  ),
                                                ],
                                              )),
                                        if (element['bd'] == 'T')
                                          PopupMenuItem<int>(
                                              value: 1,
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.remove,
                                                    color: Color(0xFF6A1B9A),
                                                  ),
                                                  Text(
                                                    " Quitar",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF6A1B9A)),
                                                  ),
                                                ],
                                              )),
                                        PopupMenuItem<int>(
                                            value: 2,
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons.share,
                                                  color: Color(0xFF6A1B9A),
                                                ),
                                                Text(
                                                  " Compartir",
                                                  style: TextStyle(
                                                      color: Color(0xFF6A1B9A)),
                                                ),
                                              ],
                                            )),
                                      ];
                                    },
                                    onSelected: (value) async {
                                      if (value == 0) {
                                        //Guarda el elemento en la bd local
                                        await insert(element);
                                      } else if (value == 1) {
                                        //Elimina el elemento de la bd local
                                        await delete(element);
                                        SaveItemsController.to.fetchElements();
                                      } else if (value == 2) {
                                        print("Logout menu is selected.");
                                      }
                                    }),
                              )
                            ],
                          )
                          /* Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: size.width * 0.07,
                            height: size.height * 0.04,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: const Color(0xFF6A1B9A)),
                              // shape: BoxShape.circle,
                            ),
                          ),
                          const Positioned(
                            child: Icon(
                              Icons.bookmark_add,
                              color: Color(0xFF6A1B9A),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: size.width * 0.07,
                            height: size.height * 0.04,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: const Color(0xFF6A1B9A)
                                  // shape: BoxShape.circle,
                                  ),
                            ),
                          ),
                          const Positioned(
                            child: Icon(
                              Icons.share,
                              color: Color(0xFF6A1B9A),
                            ),
                          ),
                        ],
                      )*/
                        ],
                      )
                    ],
                  ),
                )),
            ScrollOnExpand(
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                    tapBodyToCollapse: true,
                    tapBodyToExpand: true,
                    iconSize: 30,
                    iconColor: Color(0xFF6A1B9A)),
                header: TextButton(
                  onPressed: () {
                    _launchUrl();
                  },
                  child: Text(
                    element['titulo'],
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Requisitos: ${element['requisitos']}',
                                softWrap: true,
                                //maxLines: 1,
                                //overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Color(0xFF6A1B9A),
                                    fontWeight: FontWeight.bold)),
                            const Text(''),
                            Text('Cierre: ${element['cierre']}',
                                softWrap: false,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Color(0xFF6A1B9A),
                                    fontWeight: FontWeight.bold)),
                          ],
                        )),
                  ],
                ),
                collapsed: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text('Requisitos: ${element['requisitos']}',
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color(0xFF6A1B9A),
                          fontWeight: FontWeight.bold)),
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            )
            // ),
          ],
        ),
      ),
    ),
  );
}
