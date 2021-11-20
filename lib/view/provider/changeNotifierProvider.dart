import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarNotifer with ChangeNotifier {
  int speed = 120;

  CarNotifer() {
    speed = 100;
  }

  void increcase() {
    speed += 5;
    notifyListeners();
  }

  void hitBrake() {
    speed = max(0, speed - 30);
    notifyListeners();
  }
}

final carProvider = ChangeNotifierProvider<CarNotifer>((ref) => CarNotifer());

class ChangeNotifierProviderPage extends ConsumerWidget {
  const ChangeNotifierProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final car = watch(carProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Speed:${car.speed}"),
            buildButtom(context, car),
          ],
        ),
      ),
    );
  }

  Widget buildButtom(BuildContext context, CarNotifer car) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              car.increcase();
            },
            child: const Text("インクリメンチぃ"),
          ),
          ElevatedButton(
            onPressed: () {
              car.hitBrake();
            },
            child: const Text("デクリメンち"),
          ),
        ],
      );
}
