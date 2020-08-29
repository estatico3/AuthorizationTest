import 'package:authorization/scenes/sign_in/components/body.dart';
import 'package:authorization/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuthorizationApp extends StatefulWidget {
  @override
  _AuthorizationAppState createState() => _AuthorizationAppState();
}

class _AuthorizationAppState extends State<AuthorizationApp> {
  final RouteObserver _routeObserver = RouteObserver();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      navigatorObservers: [_routeObserver],
      home: SignInScene(),
    );
  }
}
