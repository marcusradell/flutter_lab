import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MeasurementScreen extends StatelessWidget {
  final String id;

  const MeasurementScreen(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                child: Text("Measurement $id"),
                onPressed: () {
                  context.goNamed('home');
                })));
  }
}
