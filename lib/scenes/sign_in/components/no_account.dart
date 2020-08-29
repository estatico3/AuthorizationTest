import 'package:authorization/scenes/sign_up/components/body.dart';
import 'package:authorization/theme/app_theme.dart';
import 'package:flutter/material.dart';

class NoAccountRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ",
            style: Theme.of(context).textTheme.subtitle2),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SignUpScene();
            }));
          },
          child: Text("Sign Up",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(color: AppTheme.accentColor)),
        )
      ],
    );
  }
}
