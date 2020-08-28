import 'package:authorization/shared/auth_textfield.dart';
import 'package:authorization/shared/default_button.dart';
import 'package:authorization/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScene extends StatelessWidget {
  final String title = "Forgot Password";
  final String subtitle = """Please enter your email and we will send
      you a link to return to your account""";
  final String actionTitle = "Continue";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 16.0,),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.subtitle2,
                  )
                ],
              ),
            ),
            Spacer(),
            AuthorizationTextField(
              labelText: "Email",
              hintText: "Enter your email",
              suffixIcon: Icons.mail_outline,
              onChange: (value) {},
              validator: (value) {},
            ),
            Spacer(),
            DefaultButton(
              onPress: () {},
              actionTitle: actionTitle,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",
                    style: Theme.of(context).textTheme.subtitle2),
                GestureDetector(
                  onTap: () {},
                  child: Text("Sign Up",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: AppTheme.accentColor)),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
