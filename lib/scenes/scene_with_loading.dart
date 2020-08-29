import 'package:authorization/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SceneWithLoading extends StatelessWidget {
  final Widget body;
  final bool isLoading;

  const SceneWithLoading({Key key, @required this.body, @required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetsToShow = [body];
    if (isLoading) {
      FocusScopeNode _scope = FocusScope.of(context);
      if(!_scope.hasPrimaryFocus) {
        _scope.unfocus();
      }
      widgetsToShow.add(buildLoading());
    }
    return Stack(children: widgetsToShow);
  }

  Widget buildLoading() {
    return Container(
      decoration:
          BoxDecoration(color: AppTheme.backgroundColor.withOpacity(0.75)),
      child: Center(
        child: SizedBox(
          width: 64.0,
          height: 64.0,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(AppTheme.accentColor),
          ),
        ),
      ),
    );
  }
}
