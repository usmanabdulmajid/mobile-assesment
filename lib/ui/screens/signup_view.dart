import 'package:flutter/material.dart';
import 'package:mobile_assesment/ui/screens/forgot_password_screen.dart';
import 'package:mobile_assesment/ui/widgets/border_button.dart';
import 'package:mobile_assesment/ui/widgets/custom_textfield.dart';
import 'package:mobile_assesment/utils/alert.dart';
import 'package:mobile_assesment/utils/constants.dart';
import 'package:mobile_assesment/utils/spacing.dart';
import 'package:mobile_assesment/utils/validator.dart';

class SignupView extends StatelessWidget with Validator {
  final Function(int) onChanged;
  const SignupView({Key? key, required this.onChanged}) : super(key: key);
  static final _formkey = GlobalKey<FormState>();
  static final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kmediumspace),
        child: Column(
          children: [
            CustomTextfield(
              label: 'Full Name',
              textInputType: TextInputType.text,
              validator: validateName,
            ),
            const YMargin(ksmallspace),
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
              controller: _passwordController,
              validator: validatePassword,
            ),
            const YMargin(ksmallspace),
            CustomTextfield(
              label: 'Confirm Password',
              password: true,
              textInputType: TextInputType.visiblePassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field can\'t be empty';
                }
                if (_passwordController.text != value) {
                  return 'Password doesn\'t match';
                }
                return null;
              },
            ),
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
                )),
                child: const Text('forgot password?'),
              ),
            ),
            const YMargin(ksmallspace),
            BorderButton(
              label: 'Register',
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Alert.showFlushbar(context, text: 'Sign up successful');
                }
              },
            ),
            const YMargin(kspace),
            GestureDetector(
              onTap: () {
                onChanged.call(0);
              },
              child: const Text(
                'Already have an account? Login',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
