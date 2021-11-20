import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Car {
  final int speed;
  final int doors;
  const Car({
    // required this.speed,
    // required this.doors,
    this.speed = 120,
    this.doors = 4,
  });

  Car copy({
    required int speed,
    required int doors,
  }) =>
      Car(speed: speed, doors: doors);
}

class CarNotifer with ChangeNotifier {
  int speed = 120;

  CarNotifer() {
    speed = 100;
  }

  void increcase() {
    speed += 5;
  }

  void hitBrake() {
    speed = max(0, speed - 30);
  }
}

// final stateNotifireProvider =
//     StateNotifierProvider<CarNotifer>((ref) => CarNotifer());

class StateNotifierProviderPage extends StatelessWidget {
  const StateNotifierProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
