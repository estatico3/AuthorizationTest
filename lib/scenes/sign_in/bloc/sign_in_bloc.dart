import 'dart:async';

import 'package:authorization/scenes/sign_in/bloc/services/sign_in_service.dart';

class SignInBloc {
  final StreamController<String> _emailController =
      StreamController.broadcast();
  final StreamController<String> _passwordController =
      StreamController.broadcast();
  final StreamController<bool> _loadingController =
      StreamController.broadcast();

  final SignInService _signInService;

  SignInBloc(this._signInService) {
    _listenInputStreams();
  }

  Stream<bool> get loadingStream => _loadingController.stream;

  StreamSink<String> get passwordSink => _passwordController.sink;

  StreamSink<String> get emailSink => _emailController.sink;

  String _email = "";
  String _password = "";

  void signIn() {
    _loadingController.add(true);
    _signInService.signIn(email: _email, password: _password).then((value) {
      _loadingController.add(false);
      print(value);
    });
  }

  void _listenInputStreams() {
    _emailController.stream.listen((event) {
      _email = event;
    });
    _passwordController.stream.listen((event) {
      _password = event;
    });
  }
}
