import 'package:flutter/material.dart';
import 'package:mobile_assesment/ui/screens/forgot_password_screen.dart';
import 'package:mobile_assesment/ui/widgets/border_button.dart';
import 'package:mobile_assesment/ui/widgets/custom_textfield.dart';
import 'package:mobile_assesment/utils/constants.dart';
import 'package:mobile_assesment/utils/spacing.dart';
import 'package:mobile_assesment/utils/validator.dart';

class LoginView extends StatelessWidget with Validator {
  final Function(int) onChanged;
  LoginView({Key? key, required this.onChanged}) : super(key: key);
  static final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kmediumspace),
        child: Column(
          children: [
            CustomTextfield(
              label: 'Email',
              textInputType: TextInputType.emailAddress,
              validator: validateEmail,
            ),
            const YMargin(ksmallspace),
            CustomTextfield(
              label: 'Password',
              password: true,
              textInputType: TextInputType.visiblePassword,
              validator: validatePassword,
            ),
            const YMargin(ksmallspace),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ForgotPasswordScreen()));
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    const Color(0xffF84E69),
                  ),
                ),
                child: const Text('forgot password?'),
              ),
            ),
            const YMargin(kspace),
            BorderButton(
              label: 'Login',
              onTap: () {
                if (_formkey.currentState!.validate()) {}
              },
            ),
            const YMargin(kspace),
            GestureDetector(
              onTap: () {
                onChanged.call(1);
              },
              child: const Text(
                'Don\'t have an account? Create',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
