import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum_13/view/detail_page.dart';
import 'package:praktikum_13/view_model/counter_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Praktikum 13'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  controller.counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Get.toNamed('/detail');
                    Get.to(DetailPage());
                  },
                  child: const Text(
                    'Go to Detail Page',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                )
              ],
            )),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: controller.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: controller.decrementCounter,
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: controller.getSnackbar,
            child: Icon(Icons.message),
          ),
          FloatingActionButton(
            onPressed: controller.getBottomSheet,
            child: Icon(Icons.confirmation_num),
          )
        ],
      ),
    );
  }
}
