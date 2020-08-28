import 'package:authorization/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuthorizationTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData suffixIcon;
  final bool obscureText;
  final Function(String) onChange;
  final Function(String) validator;

  const AuthorizationTextField(
      {Key key,
      @required this.labelText,
      @required this.suffixIcon,
      this.obscureText = false,
      @required this.onChange,
      @required this.validator,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(fontSize: 21),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.only(left: 32.0, top: 16.0, bottom: 16.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: AppTheme.borderColor, width: 2),
          ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyText1,
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.bodyText1,
          suffixIcon: Icon(suffixIcon, color: AppTheme.textColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          filled: true,
          fillColor: AppTheme.backgroundColor,
        ),
        autovalidate: true,
        onChanged: (value) => onChange(value),
        validator: (value) => validator(value),
        obscureText: obscureText,
      ),
    );
  }
}
