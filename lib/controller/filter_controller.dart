import 'package:get/get.dart';

class FilterController extends GetxController {
  static FilterController get to => Get
      .find(); //Se utiliza para crear un getter estático que devuelve la instancia del SaveItemsController utilizando la función Get.find()

  List<bool> levels = [false, false, false, false];
  List<bool> modalitys = [false, false, false];
  bool opLevel = false;
  bool opModality = false;
  bool isButtonEnabled = true;

  //Cambio el estado de la casilla que se seleccionó y busco cuál es el estado general de todas las casillas juntas:
  // false: Ninguna está marcada, true: Todas están marcadas
  void selectedLevel(int i) {
    levels[i] = !levels[i];
    if (levels.every((element) => element == true)) {
      opLevel = true;
    } else {
      opLevel = false;
    }
    enableOrDisableButton();
  }

  //Cambio el estado de la casilla que se seleccionó y busco cuál es el estado general de todas las casillas juntas:
  // false: Ninguna está marcada, true: Todas están marcadas
  void selectedModality(int i) {
    modalitys[i] = !modalitys[i];
    if (modalitys.every((element) => element == true)) {
      opModality = true;
    } else {
      opModality = false;
    }
    enableOrDisableButton();
  }

  //Habilitar o desabilitar el botón
  void enableOrDisableButton() {
    if (opLevel == true || opModality == true) {
      isButtonEnabled = false;
    } else {
      isButtonEnabled = true;
    }
    update();
  }
}
