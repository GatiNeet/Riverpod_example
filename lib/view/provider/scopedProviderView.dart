import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scopedProvider = ScopedProvider<int>((ref) => 0);

class ScopedProviderPage extends StatelessWidget {
  const ScopedProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildScoped(43),
            buildScoped(35),
            buildScoped(),
          ],
        ),
      ),
    );
  }

  Widget buildScoped([int? value]) {
    final consumer = Consumer(
      builder: (context, watch, child) {
        final scoped = watch(scopedProvider).toString();
        return Text(scoped);
      },
    );
    return value == null
        ? consumer
        : ProviderScope(
            overrides: [
              scopedProvider.overrideWithValue(value),
            ],
            child: consumer,
          );
  }
}
