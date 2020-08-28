import 'package:authorization/app.dart';
import 'package:authorization/app_container.dart';
import 'package:authorization/managers/bloc_provider.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  var blocProvider = BlocProvider();

  runApp(AppContainer(
    blocProvider: blocProvider,
    child: AuthorizationApp(),
  ));
}

