import 'package:get/get.dart';
import 'package:state_get_x/app/modules/models/mobil.dart';

class MobilController extends GetxController {
  var idaman = Mobil(merek: 'Hyundai', nama: 'Ioniq 8').obs;

  void changeUpperCase() {
    idaman.update((_) {
      idaman.value.nama = idaman.value.nama.toString().toUpperCase();
    });
  }

  void changeLowerCase() {
    idaman.update((_) {
      idaman.value.nama = idaman.value.nama.toString().toLowerCase();
    });
  }
}
