import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/view/widget/appbarWidget.dart';

final numberProvder = Provider<int>((ref) {
  return 42;
});

class ProviderView extends StatelessWidget {
  const ProviderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Consumer(
          builder: (context, watch, child) {
            final number = watch(numberProvder);
            return Text(number.toString());
          },
        ),
      ),
    );
  }
}
