import 'package:authorization/constants.dart';
import 'package:authorization/scenes/forgot_password/components/body.dart';
import 'package:authorization/scenes/sign_in/bloc/sign_in_bloc.dart';
import 'package:authorization/shared/auth_textfield.dart';
import 'package:authorization/shared/default_button.dart';
import 'package:authorization/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final SignInBloc _signInBloc;

  const AuthForm(this._signInBloc);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final List<String> _errorsList = [];
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _shouldRemember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
                  value: _shouldRemember,
                  onChanged: (bool value) {
                    setState(() {
                      _shouldRemember = value;
                    });
                  },
                ),
                Text(
                  "Remember me",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ForgotPasswordScene();
                    }));
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
          buildErrorsList(_errorsList),
          SizedBox(height: 8.0),
          DefaultButton(
            onPress: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                widget._signInBloc.signIn();
              }
            },
            actionTitle: "Sign in",
          ),
        ],
      ),
    );
  }

  ListView buildErrorsList(List<String> errors) {
    return ListView(
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
    );
  }

  AuthorizationTextField buildEmailField() {
    return AuthorizationTextField(
      controller: _emailController,
      labelText: "Email",
      hintText: "Enter your email",
      suffixIcon: Icons.mail_outline,
      onChange: (value) {
        widget._signInBloc.emailSink.add(value);
        if (value.isNotEmpty) {
          _removeError(error: emptyEmailError);
        }
        if (emailRegex.hasMatch(value)) {
          _removeError(error: invalidEmailFormatError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          _addError(error: emptyEmailError);
          return "";
        } else if (!emailRegex.hasMatch(value)) {
          _addError(error: invalidEmailFormatError);
          return "";
        }
        return null;
      },
    );
  }

  AuthorizationTextField buildPasswordField() {
    return AuthorizationTextField(
      controller: _passwordController,
      labelText: "Password",
      hintText: "Enter your password",
      suffixIcon: Icons.lock_outline,
      onChange: (value) {
        widget._signInBloc.passwordSink.add(value);
        if (value.isNotEmpty) {
          _removeError(error: emptyPasswordError);
        }
        if (value.length > 7) {
          _removeError(error: shortPasswordError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          _addError(error: emptyPasswordError);
          return "";
        } else if (value.length < 8) {
          _addError(error: shortPasswordError);
          return "";
        }
        return null;
      },
      obscureText: true,
    );
  }

  void _addError({String error}) {
    if (!_errorsList.contains(error)) {
      setState(() {
        _errorsList.add(error);
      });
    }
  }

  void _removeError({String error}) {
    if (_errorsList.contains(error)) {
      setState(() {
        _errorsList.remove(error);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    print("disposed");
  }
}
