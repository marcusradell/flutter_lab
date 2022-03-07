import 'package:flutter/material.dart';
import 'package:flutter_lab/app_router/router.dart';
import 'package:provider/provider.dart';

import 'sign_in_status.dart';

class AppRouter extends StatelessWidget {
  final signInStatus = SignInStatus();
  final String title;
  // final Widget public;
  // final Widget private;

  AppRouter(
      {required this.title,
      // required this.public,
      // required this.private,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var goRouter = createRouter(signInStatus);

    var router = MaterialApp.router(
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      title: title,
    );

    return ChangeNotifierProvider<SignInStatus>(
        create: (_) => signInStatus, child: router);
  }
}
