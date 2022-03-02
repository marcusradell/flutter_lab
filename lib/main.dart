// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_lab/screens/home.dart';
import 'package:flutter_lab/screens/measurement.dart';
import 'package:flutter_lab/screens/sign_in.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  static const title = "Marcus Rådell's Flutter Lab";

  @override
  Widget build(BuildContext context) => MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: title,
      themeMode: ThemeMode.dark,
      theme: ThemeData(scaffoldBackgroundColor: Colors.black));

  final _router = GoRouter(
      initialLocation: '/sign_in',
      routes: [
        GoRoute(
          name: 'sign_in',
          path: '/sign_in',
          builder: (ctx, state) => const SignInScreen(),
        ),
        GoRoute(
            name: 'home',
            path: '/',
            builder: (ctx, state) => const HomeScreen(),
            routes: [
              GoRoute(
                  name: 'measurement',
                  path: 'measurements/:id',
                  builder: (ctx, state) =>
                      MeasurementScreen(state.params['id']!))
            ]),
      ],
      errorBuilder: (context, state) =>
          Scaffold(body: Center(child: Text(state.error.toString()))));
}
