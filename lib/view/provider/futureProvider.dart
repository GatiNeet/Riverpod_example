import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<int> fetchInt() async {
  await Future.delayed(const Duration(seconds: 3));
  return 12;
}

final futureProvider = FutureProvider.autoDispose<int>((ref) => fetchInt());

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, watch) {
    final future = watch(futureProvider);
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
        child: future.when(
          data: (value) => Text(value.toString()),
          loading: () => const CircularProgressIndicator(),
          error: (e, stack) => Text('Error:$e'),
        ),
      ),
    );
  }
}
