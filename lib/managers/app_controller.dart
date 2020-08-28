import 'package:authorization/app_container.dart';
import 'package:flutter/material.dart';

class AppController extends InheritedWidget {
  final Widget child;
  final AppContainerState state;

  AppController({this.child, this.state}) : super(child: child);

  @override
  bool updateShouldNotify(AppController oldWidget) {
    return this.state != oldWidget.state;
  }
}
