import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = Provider<int>((ref) => 3);

Future<String> featchData(int number) async {
  await Future.delayed(const Duration(seconds: 3));
  return number >= 5 ? "５以下です" : "５より上です";
}

final futureProvider = FutureProvider<String>((ref) async {
  final number = ref.watch(numberProvider);
  return featchData(number);
});

class CombinedProviderPage extends ConsumerWidget {
  const CombinedProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final futureBigSmall = watch(futureProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: futureBigSmall.when(
          data: (value) => Text(value),
          loading: () => const CircularProgressIndicator(),
          error: (e, stack) => Text('Error:$e'),
        ),
      ),
    );
  }
}
