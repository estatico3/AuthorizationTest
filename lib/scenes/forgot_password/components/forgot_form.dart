import 'package:authorization/constants.dart';
import 'package:authorization/shared/auth_textfield.dart';
import 'package:authorization/shared/default_button.dart';
import 'package:authorization/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final String actionTitle = "Continue";
  final GlobalKey<FormState> _formState = GlobalKey();
  final List<String> _errorsList = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formState,
      child: Column(
        children: [
          AuthorizationTextField(
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
          ),
          buildErrorsList(_errorsList),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          DefaultButton(
            onPress: () {
              _formState.currentState.validate();
            },
            actionTitle: actionTitle,
          ),
        ],
      ),
    );
  }

  ListView buildErrorsList(List<String> errors) {
    return ListView(
      shrinkWrap: true,
      children: List.generate(errors.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Icon(Icons.cancel, color: AppTheme.accentColor, size: 16.0),
              SizedBox(
                width: 4.0,
              ),
              Text(errors[index]),
            ],
          ),
        );
      }),
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
