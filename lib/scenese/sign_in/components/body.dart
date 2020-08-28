import 'package:authorization/scenese/sign_in/components/auth_form.dart';
import 'package:authorization/scenese/sign_in/components/social_button.dart';
import 'package:authorization/shared/default_button.dart';
import 'package:authorization/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(color: AppTheme.backgroundColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 24.0,
                  ),
                  buildTitle(context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  AuthForm(),
                  SizedBox(height: 24),
                  DefaultButton(
                    onPress: () {},
                    actionTitle: "Sign in",
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  buildSocialButtons(),
                  SizedBox(
                    height: 24.0,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Do not have an account? ",
                          style: Theme.of(context).textTheme.subtitle2),
                      TextSpan(
                          text: "Sign up",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(color: AppTheme.accentColor)),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Row buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SocialButton(
          color: Colors.green,
          iconPath: 'lib/theme/images/google.svg',
          onTap: () {},
        ),
        SocialButton(
          color: Colors.blueAccent,
          iconPath: 'lib/theme/images/facebook.svg',
          onTap: () {},
        ),
        SocialButton(
            color: Colors.blue,
            iconPath: 'lib/theme/images/twitter.svg',
            onTap: () {}),
      ],
    );
  }

  SizedBox buildTitle(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text("Welcome Back", style: Theme.of(context).textTheme.title),
          SizedBox(
            height: 16.0,
          ),
          Text(
            "Sign in with your email and password \nor continue wish social media",
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
