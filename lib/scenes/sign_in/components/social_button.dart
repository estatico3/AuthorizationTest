import 'package:authorization/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;

  const SocialButton({Key key, this.iconPath, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.backgroundColor,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
          onTap: () => onTap(),
          splashColor: AppTheme.backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppTheme.borderColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0)),
            child: SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
