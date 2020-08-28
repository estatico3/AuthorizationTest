import 'package:authorization/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPress;
  final String actionTitle;

  const DefaultButton(
      {Key key, @required this.onPress, @required this.actionTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.0,
      child: RaisedButton(
        color: AppTheme.accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        child: Text(
          actionTitle,
          style: Theme.of(context)
              .textTheme
              .button
              .copyWith(color: AppTheme.backgroundColor),
        ),
        onPressed: () {},
      ),
    );
  }
}
