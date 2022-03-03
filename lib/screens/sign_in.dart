import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  final String? from;
  const SignInScreen({this.from, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      child: const Text('Sign in'),
      onPressed: () {
        if (from == null) {
          context.goNamed('home');
        } else {
          context.go(from!);
        }
      },
    )));
  }
}
