import 'package:authorization/app_container.dart';
import 'package:authorization/scenes/scene_with_loading.dart';
import 'package:authorization/scenes/sign_in/bloc/sign_in_bloc.dart';
import 'package:authorization/scenes/sign_in/components/auth_form.dart';
import 'package:authorization/scenes/sign_in/components/social_button.dart';
import 'package:authorization/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'file:///E:/Flutter_projects/authorization/lib/scenes/sign_in/components/no_account.dart';

class SignInScene extends StatefulWidget {
  @override
  _SignInSceneState createState() => _SignInSceneState();
}

class _SignInSceneState extends State<SignInScene> {
  SignInBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: StreamBuilder<bool>(
            initialData: false,
            stream: _bloc.loadingStream,
            builder: (context, snapshot) {
              return SceneWithLoading(
                isLoading: snapshot.data,
                body: buildBody(context, _bloc),
              );
            }));
  }

  SafeArea buildBody(BuildContext context, SignInBloc _bloc) {
    return SafeArea(
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
              AuthForm(_bloc),
              SizedBox(
                height: 24.0,
              ),
              buildSocialButtons(),
              SizedBox(
                height: 24.0,
              ),
              NoAccountRow()
            ],
          ),
        ),
      ),
    );
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
          Text("Welcome Back", style: Theme.of(context).textTheme.headline6),
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = AppContainerState.of(context).blocProvider.signInBloc;
  }
}
