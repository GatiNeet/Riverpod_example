import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider.autoDispose<String>((ref) {
  return Stream.periodic(
    const Duration(milliseconds: 1000),
    (count) => "$count",
  );
});

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, watch) {
    final stream = watch(streamProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: stream.when(
          data: (value) => Text(value),
          loading: () => const CircularProgressIndicator(),
          error: (e, stack) => Text('Error:$e'),
        ),
      ),
    );
  }
}
