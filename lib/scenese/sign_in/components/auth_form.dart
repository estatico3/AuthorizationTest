import 'package:authorization/scenese/forgot_password/components/body.dart';
import 'package:authorization/shared/auth_textfield.dart';
import 'package:authorization/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<State> formKey = GlobalKey();
  final List<String> _errorsList = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildEmailField(),
          SizedBox(
            height: 8,
          ),
          buildPasswordField(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: <Widget>[
                Checkbox(
                  activeColor: AppTheme.accentColor,
                  value: true,
                  onChanged: (bool value) {},
                ),
                Text(
                  "Remember me",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ForgotPasswordScene();
                      }
                    ));
                  },
                  child: Text(
                    "Forgot password",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: List.generate(_errorsList.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.cancel, color: AppTheme.accentColor, size: 16.0),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(_errorsList[index]),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  AuthorizationTextField buildEmailField() {
    return AuthorizationTextField(
      labelText: "Email",
      hintText: "Enter your email",
      suffixIcon: Icons.mail_outline,
      onChange: (value) {
        if (value.isNotEmpty &&
            _errorsList.contains("Please enter your email")) {
          setState(() {
            _errorsList.remove("Please enter your email");
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !_errorsList.contains("Please enter your email")) {
          _errorsList.add("Please enter your email");
        }
        return null;
      },
    );
  }

  AuthorizationTextField buildPasswordField() {
    return AuthorizationTextField(
      labelText: "Password",
      hintText: "Enter your password",
      suffixIcon: Icons.lock_outline,
      onChange: (value) {
        if (value.isNotEmpty && _errorsList.contains("Please enter password")) {
          setState(() {
            _errorsList.remove("Please enter password");
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !_errorsList.contains("Please enter password")) {
          _errorsList.add("Please enter password");
        }
        return null;
      },
      obscureText: true,
    );
  }
}
