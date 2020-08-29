import 'package:authorization/scenes/sign_in/components/social_button.dart';
import 'package:authorization/scenes/sign_up/components/sign_up_form.dart';
import 'package:authorization/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SignUpScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(color: AppTheme.backgroundColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 24.0),
                  buildTitle(context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SignUpForm(),
                  SizedBox(height: 24.0),
                  buildSocialButtons(),
                  SizedBox(height: 24.0),
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
          iconPath: 'lib/theme/images/google.svg',
          onTap: () {},
        ),
        SocialButton(
          iconPath: 'lib/theme/images/facebook.svg',
          onTap: () {},
        ),
        SocialButton(iconPath: 'lib/theme/images/twitter.svg', onTap: () {}),
      ],
    );
  }

  SizedBox buildTitle(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text("Welcome", style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 16.0),
          Text(
            "Sign up with your email and password \nor continue wish social media",
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
