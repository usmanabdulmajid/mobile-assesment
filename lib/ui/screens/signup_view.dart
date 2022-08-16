import 'package:flutter/material.dart';
import 'package:mobile_assesment/ui/screens/forgot_password_screen.dart';
import 'package:mobile_assesment/ui/widgets/border_button.dart';
import 'package:mobile_assesment/ui/widgets/custom_textfield.dart';
import 'package:mobile_assesment/utils/constants.dart';
import 'package:mobile_assesment/utils/spacing.dart';

class SignupView extends StatelessWidget {
  final Function(int) onChanged;
  const SignupView({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kmediumspace),
      child: Column(
        children: [
          const CustomTextfield(label: 'Full Name'),
          const YMargin(ksmallspace),
          const CustomTextfield(label: 'Email'),
          const YMargin(ksmallspace),
          const CustomTextfield(label: 'Password'),
          const YMargin(ksmallspace),
          const CustomTextfield(label: 'Confirm Password'),
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
              )),
              child: const Text('forgot password?'),
            ),
          ),
          const YMargin(kspace),
          BorderButton(
            label: 'Register',
            onTap: () {},
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
    );
  }
}
