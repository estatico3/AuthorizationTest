import 'package:authorization/managers/app_controller.dart';
import 'package:authorization/managers/bloc_provider.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatefulWidget {
  final Widget child;
  final BlocProvider blocProvider;

  const AppContainer({Key key, this.blocProvider, this.child})
      : super(key: key);

  @override
  AppContainerState createState() => AppContainerState();

  static AppContainerState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppController>().state;
  }
}

class AppContainerState extends State<AppContainer> {
  BlocProvider get blocProvider => widget.blocProvider;

  @override
  Widget build(BuildContext context) {
    return AppController(
      state: this,
      child: widget.child,
    );
  }
}
