import 'package:get/get.dart';

import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void increment() => counter++;
  void decrement() => counter--;
}
