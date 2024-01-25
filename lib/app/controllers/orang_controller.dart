import 'package:get/get.dart';
import 'package:state_get_x/app/modules/models/orang.dart';

class OrangController extends GetxController {
  var terkece = Orang();

  void changeUpperCase() {
    terkece.nama.value = terkece.nama.value.toUpperCase();
  }

  void changeLowerCase() {
    terkece.nama.value = terkece.nama.value.toLowerCase();
  }
}
