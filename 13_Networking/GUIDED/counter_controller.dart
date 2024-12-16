import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
    counter--;
  }

  void getSnackbar() {
    Get.snackbar(
      'Ini judul snacbar',
      'Ini isi snacbar menggunakan GetX',
      duration: const Duration(seconds: 3),
    );
  }

  void getBottomSheet() {
    Get.bottomSheet(Container(
        height: 200,
        color: Colors.blueAccent,
        child: Center(
          child: Text(
            'Ini adalah getx bottomsheet',
            style: TextStyle(color: Colors.white),
          ),
        )
      )
    );
  }
}
