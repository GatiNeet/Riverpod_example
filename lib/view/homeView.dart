import 'package:riverpod_example/view/provider/changeNotifierProvider.dart';
import 'package:riverpod_example/view/provider/combinedProviderPage.dart';
import 'package:riverpod_example/view/provider/futureProvider.dart';
import 'package:riverpod_example/view/provider/providerView.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_example/view/provider/scopedProviderView.dart';
import 'package:riverpod_example/view/provider/stateProvider.dart';
import 'package:riverpod_example/view/provider/streamProviderPage.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProviderView()),
                );
              },
              child: const Text("Provider"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StateProviderPage(),
                  ),
                );
              },
              child: const Text("StateProvider"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FutureProviderPage(),
                  ),
                );
              },
              child: const Text("FutureProvider"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StreamProviderPage(),
                  ),
                );
              },
              child: const Text("StreamProvider"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScopedProviderPage(),
                  ),
                );
              },
              child: const Text("ScopedProvider"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CombinedProviderPage(),
                  ),
                );
              },
              child: const Text("CombinedProvider"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangeNotifierProviderPage(),
                  ),
                );
              },
              child: const Text("ChangeNotifierProvider"),
            ),
          ],
        ),
      ),
    );
  }
}
