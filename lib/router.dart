import 'package:flutter/material.dart';
import 'package:flutter_lab/screens/signed_in.dart';
import 'package:flutter_lab/sign_in_status.dart';
import 'package:go_router/go_router.dart';

import 'screens/home.dart';
import 'screens/measurement.dart';
import 'screens/sign_in.dart';

final _routes = [
  GoRoute(
    name: 'sign_in',
    path: '/sign_in',
    builder: (ctx, state) => SignInScreen(from: state.queryParams['from']),
  ),
  GoRoute(
      name: 'home',
      path: '/',
      // builder: (ctx, state) => const HomeScreen(),
      builder: (ctx, state) => const SignedInScreen(),
      routes: [
        GoRoute(
            name: 'measurement',
            path: 'measurements/:id',
            builder: (ctx, state) => MeasurementScreen(state.params['id']!))
      ]),
];

GoRouter createRouter(SignInStatus signInStatus) {
  final goRouter = GoRouter(
      refreshListenable: signInStatus,
      redirect: (state) {
        final signedIn = signInStatus.isSignedIn;
        final signInLoc = state.namedLocation('sign_in');
        final headingToSignIn = state.subloc == signInLoc;

        if (!signedIn && !headingToSignIn) {
          return state
              .namedLocation('sign_in', queryParams: {'from': state.subloc});
        }

        var from = state.queryParams['from'];

        if (signedIn && from != null) {
          return from;
        }

        if (signedIn && headingToSignIn) {
          return state.namedLocation('home');
        }

        return null;
      },
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: _routes,
      errorBuilder: (context, state) =>
          Scaffold(body: Center(child: Text(state.error.toString()))));

  return goRouter;
}
