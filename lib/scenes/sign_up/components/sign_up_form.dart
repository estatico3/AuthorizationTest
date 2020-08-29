import 'package:authorization/constants.dart';
import 'package:authorization/shared/auth_textfield.dart';
import 'package:authorization/shared/default_button.dart';
import 'package:authorization/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final List<String> _errorsList = [];
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildEmailField(),
          SizedBox(height: 8.0),
          buildPasswordField(),
          SizedBox(height: 8.0),
          buildConfirmedField(),
          SizedBox(height: 8.0),
          buildErrorsList(_errorsList),
          SizedBox(height: 8.0),
          DefaultButton(
            onPress: () {
              _formKey.currentState.validate();
            },
            actionTitle: "Sign Up",
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
      labelText: "Email",
      hintText: "Enter your email",
      suffixIcon: Icons.mail_outline,
      onChange: (value) {
        if (value.isNotEmpty) {
          _removeError(error: emptyEmailError);
        } else if (emailRegex.hasMatch(value)) {
          _removeError(error: invalidEmailFormatError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          _addError(error: emptyEmailError);
        } else if (!emailRegex.hasMatch(value)) {
          _addError(error: invalidEmailFormatError);
        }
        return "";
      },
    );
  }

  AuthorizationTextField buildPasswordField() {
    return AuthorizationTextField(
      labelText: "Password",
      hintText: "Enter your password",
      suffixIcon: Icons.lock_outline,
      onChange: (value) {
        _password = _confirmPassword;
        if (value.isNotEmpty) {
          _removeError(error: emptyPasswordError);
        } else if (value.length > 7) {
          _removeError(error: shortPasswordError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          _addError(error: emptyPasswordError);
        } else if (value.length < 8) {
          _addError(error: shortPasswordError);
        }
        return "";
      },
      obscureText: true,
    );
  }

  AuthorizationTextField buildConfirmedField() {
    return AuthorizationTextField(
      labelText: "Confirm Password",
      hintText: "Confirm your password",
      suffixIcon: Icons.lock_outline,
      onChange: (value) {
        _confirmPassword = value;
        if (value.isNotEmpty) {
          _removeError(error: emptyPasswordError);
        } else if (value.length > 7) {
          _removeError(error: shortPasswordError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          _addError(error: emptyPasswordError);
        } else if (_confirmPassword != _password) {
          _addError(error: confirmPasswordError);
        }
        return "";
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
}
