import 'package:authorization/app.dart';
import 'package:authorization/app_container.dart';
import 'package:authorization/managers/bloc_provider.dart';
import 'package:authorization/scenes/sign_in/bloc/services/sign_in_service.dart';
import 'package:authorization/scenes/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  final firebaseSignIn = FirebaseSignIn();
  final signInBloc = SignInBloc(firebaseSignIn);

  var blocProvider = BlocProvider(signInBloc);

  runApp(AppContainer(
    blocProvider: blocProvider,
    child: AuthorizationApp(),
  ));
}

