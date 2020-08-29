import 'package:authorization/scenes/forgot_password/components/forgot_form.dart';
import 'package:authorization/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScene extends StatelessWidget {
  final String title = "Forgot Password";
  final String subtitle = """Please enter your email and we will send
      you a link to return to your account""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppTheme.backgroundColor,
      body: SingleChildScrollView(
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
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              ForgotPasswordForm(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
