import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/app/const.dart';
import 'package:flutter_mvvm_boilerplate/app/size_config.dart';
import 'package:flutter_mvvm_boilerplate/app/util/login_util.dart';
import 'package:flutter_mvvm_boilerplate/data/service/response_error.dart';
import 'package:flutter_mvvm_boilerplate/provider/login_provider.dart';
import 'package:flutter_mvvm_boilerplate/provider/user_provider.dart';
import 'package:flutter_mvvm_boilerplate/ui/home/home_screen.dart';
import 'package:flutter_mvvm_boilerplate/ui/widget/feedbacks.dart';
import 'package:flutter_mvvm_boilerplate/ui/widget/rounded_button.dart';
import 'package:flutter_mvvm_boilerplate/ui/widget/rounded_input_field.dart';
import 'package:flutter_mvvm_boilerplate/ui/widget/rounded_password_field.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _id = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        _buildLoginForm(context),
        Spacer(),
      ],
    );
  }

  Container _buildLoginForm(BuildContext context) {
    final loginProvider = context.read<LoginProvider>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedInputField(
                  initialValue: loginProvider.rememberMe == true ? _id : null,
                  hintText: 'ID',
                  validator: idValidator,
                  // keyboardType: TextInputType.number,
                  onChanged: _onIdChanged,
                ),
                RoundedPasswordField(
                  hintText: 'Password',
                  validator: passwordValidator,
                  onChanged: _onPasswordChanged,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCheckBox(loginProvider.rememberMe, 'remember me',
                        (bool? newValue) {}),
                    _buildCheckBox(loginProvider.autoLogin, 'auto login',
                        (bool? newValue) {}),
                  ],
                ),
                RoundedButton(
                  text: 'LOGIN',
                  width: SizeConfig.screenWidth * 0.4,
                  onPressed: () => _onSubmit(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildCheckBox(bool checked, String title, Function(bool?) onChanged) {
    return Row(
      children: [
        Checkbox(
          value: checked,
          onChanged: onChanged,
          checkColor: Colors.white,
          activeColor: kPrimaryColor,
        ),
        Text(title),
      ],
    );
  }

  _onIdChanged(String value) {
    _id = value;
  }

  _onPasswordChanged(String value) {
    _password = value;
  }

  _onSubmit(BuildContext context) async {
    if (_formKey.currentState?.validate() == true) {
      final loginProvider = context.read<LoginProvider>();
      dynamic result = await loginProvider.login(_id, _password);
      if (result is ResponseError) {
        Feedbacks.showErrorMessage(context, result.message);
      } else {
        final userProvider = context.read<UserProvider>();
        if (loginProvider.token != null) {
          String? errorMessage =
              await userProvider.fetchUser(_id, loginProvider.token!);
          if (errorMessage == null) {
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, (route) => false);
          } else {
            Feedbacks.showErrorMessage(context, errorMessage);
          }
        }
      }
    }
  }
}
