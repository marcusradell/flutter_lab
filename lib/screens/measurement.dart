import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MeasurementScreen extends StatelessWidget {
  const MeasurementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                child: const Text("Measurement"),
                onPressed: () {
                  context.goNamed('home');
                })));
  }
}
