import 'package:flutter/material.dart';
import 'package:flutter_lab/app_router/home.dart';
import 'package:flutter_lab/app_router/sign_in_status.dart';
import 'package:go_router/go_router.dart';
// import 'screens/measurement.dart';
import 'sign_in.dart';

final _routes = [
  GoRoute(
    name: 'sign_in',
    path: '/sign_in',
    builder: (ctx, state) => SignInScreen(from: state.queryParams['from']),
  ),
  // GoRoute(name: 'private_redirect', path: '/private', routes: [
  //   GoRoute(
  //       name: 'measurement',
  //       path: 'measurements/:id',
  //       builder: (ctx, state) => MeasurementScreen(state.params['id']!))
  // ]),
  GoRoute(
      name: 'private',
      path: '/private/:tab',
      builder: (ctx, state) {
        final selectedTab = state.params['tab']!;

        return HomeScreen(selectedTab: selectedTab);
      })
];

GoRouter createRouter(SignInStatus signInStatus) {
  final goRouter = GoRouter(
      refreshListenable: signInStatus,
      redirect: (state) {
        final signedIn = signInStatus.isSignedIn;
        final signInLoc = state.namedLocation('sign_in');
        final headingToSignIn = state.subloc == signInLoc;

        if (state.subloc == '/') return '/private/home';

        if (!signedIn && !headingToSignIn) {
          return state
              .namedLocation('sign_in', queryParams: {'from': state.subloc});
        }

        var from = state.queryParams['from'];

        if (signedIn && from != null) {
          return from;
        }

        if (signedIn && headingToSignIn) {
          return state.namedLocation('private', params: {'tab': 'home'});
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
