import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:state_get_x/app/controllers/counter_controller.dart';
import 'package:state_get_x/app/controllers/mobil_controller.dart';
import 'package:state_get_x/app/controllers/orang_controller.dart';
import 'package:state_get_x/app/modules/models/mobil.dart';
import 'package:state_get_x/app/modules/models/orang.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  /// obs ini ngasih tau variabel aoa yang harus dipantau terus perubahannya
  var pelajar = Orang();
  void add() => pelajar.umur++;

  // ini kalo buat objeknya di sini
  var mobilku = Mobil(merek: 'Hyundai', nama: 'Ioniq 5').obs;

  // ngambil controller yang udah kesambung sama objek
  final orangC = Get.put(OrangController());

  // ngambil mobil dari controller
  final mobilC = Get.put(MobilController());

  // ngambil controller counter
  final counterC = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    final angkaC = Get.find<CounterController>();
    return Scaffold(
      /// ini juga untuk ngasih tau tampilan mana yang terdapar variabel obs untuk selalu dicek, kalo gaada obs nya, maka obx akan error.
      body: Container(
        width: Get.width,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///  dari class sudah ada nilai dari objeknya
              Text(
                'Nama: ${pelajar.nama}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Umur: ${pelajar.umur}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),

              /// buat objek di sini maka obs juga ditulisnya di sini, maka setelah mengambil val, ambil dulu value baru ke nama
              Text(
                'Merek: ${mobilku.value.merek}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Jenis: ${mobilku.value.nama}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),

              /// contoh jika menggunakan controller
              Text(
                'Orang Controller: ${orangC.terkece.nama}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Orang Controller: ${mobilC.idaman.value.nama}',
                style: TextStyle(fontSize: 20),
              ),
              IconButton(
                  onPressed: () {
                    orangC.changeUpperCase();
                    mobilC.changeUpperCase();
                  },
                  icon: Icon(Icons.arrow_upward)),
              IconButton(
                  onPressed: () {
                    orangC.changeLowerCase();
                    mobilC.changeLowerCase();
                  },
                  icon: Icon(Icons.arrow_downward)),
              Text('Berhitung ${counterC.counter}')
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          add();

          // contoh penggunaan kalo ngambilnya pake find
          angkaC.increment();
          pelajar.nama.value = pelajar.nama.value + 'r';
          Get.snackbar('Hi', '${pelajar.nama}');
          Get.defaultDialog(title: 'wihi');
          // ngubahnya bisa juga pake cara ini
          mobilku.update((_) {
            mobilku.value.nama = mobilku.value.nama.toString().toUpperCase();
          });
        },
      ),
    );
  }
}
