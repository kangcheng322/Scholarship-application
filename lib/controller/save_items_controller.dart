import 'package:get/get.dart';
import '../database/db.dart';

class SaveItemsController extends GetxController {
  static SaveItemsController get to => Get
      .find(); //Se utiliza para crear un getter estático que devuelve la instancia del SaveItemsController utilizando la función Get.find()
  List<Map<String, dynamic>> elements = [];

  @override
  void onInit() {
    fetchElements();
    super.onInit();
  }

  Future<void> fetchElements() async {
    elements = List.from(await getElements());
    elements.sort((a, b) => a['date'].compareTo(b['date']));
    update();
  }
}
