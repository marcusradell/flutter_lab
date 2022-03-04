import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../sign_in_status.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
        child: const Text('Home'),
        onPressed: () {
          context.goNamed('measurement', params: {'id': '100'});
        },
      ),
      ElevatedButton(
        child: const Text('Sign out'),
        onPressed: () {
          context.read<SignInStatus>().isSignedIn = false;
        },
      )
    ])));
  }
}
