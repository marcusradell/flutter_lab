import 'package:flutter/material.dart';
import 'package:flutter_lab/router.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'sign_in_status.dart';

class App extends StatelessWidget {
  final signInStatus = SignInStatus();
  final title = "Marcus Rådell's Flutter Lab";

  @override
  Widget build(BuildContext context) {
    var goRouter = createRouter(signInStatus);

    var router = MaterialApp.router(
        routeInformationParser: goRouter.routeInformationParser,
        routerDelegate: goRouter.routerDelegate,
        title: title,
        themeMode: ThemeMode.dark,
        theme: ThemeData(scaffoldBackgroundColor: Colors.black));

    return ChangeNotifierProvider<SignInStatus>(
        create: (_) => signInStatus, child: router);
  }
}
