import 'package:flutter/material.dart';
import 'package:flutter_lab/app_router/sign_in_status.dart';
import 'package:provider/provider.dart';

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
        context.read<SignInStatus>().isSignedIn = true;
      },
    )));
  }
}
