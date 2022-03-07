import 'package:flutter/material.dart';
import 'package:flutter_lab/router.dart';
import 'package:provider/provider.dart';

import '../sign_in_status.dart';

class AppRouter extends StatelessWidget {
  final signInStatus = SignInStatus();

  final String title;

  AppRouter({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var goRouter = createRouter(signInStatus);

    var router = MaterialApp.router(
        routeInformationParser: goRouter.routeInformationParser,
        routerDelegate: goRouter.routerDelegate,
        title: title,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.pink,
        ));

    return ChangeNotifierProvider<SignInStatus>(
        create: (_) => signInStatus, child: router);
  }
}
