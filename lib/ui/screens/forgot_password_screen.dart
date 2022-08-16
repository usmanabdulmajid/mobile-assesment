import 'package:flutter/material.dart';
import 'package:mobile_assesment/ui/screens/verify_otp_screen.dart';
import 'package:mobile_assesment/ui/widgets/border_button.dart';
import 'package:mobile_assesment/ui/widgets/custom_textfield.dart';
import 'package:mobile_assesment/utils/constants.dart';
import 'package:mobile_assesment/utils/extensions.dart';
import 'package:mobile_assesment/utils/spacing.dart';
import 'package:mobile_assesment/utils/validator.dart';

class ForgotPasswordScreen extends StatelessWidget with Validator {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: context.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: context.width,
                    height: context.height * 0.2,
                  ),
                  Positioned(
                    top: -(context.height * 0.13) / 2,
                    right: 0,
                    width: context.width * 0.25,
                    height: context.height * 0.15,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffF84E69),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: ktoppadding,
                    left: kmediumspace,
                    width: context.width * 0.1,
                    height: context.width * 0.1,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffFF647C),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -(context.width * 0.1) / 2,
                    right: kLargespace,
                    width: context.width * 0.15,
                    height: context.width * 0.15,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffFF647C),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              const YMargin(kLargespace),
              Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kmediumspace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Reset \npassword',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const YMargin(kLargespace),
                      CustomTextfield(
                        label: 'Email',
                        textInputType: TextInputType.emailAddress,
                        validator: validateEmail,
                      ),
                      const YMargin(kxtralargespace),
                      BorderButton(
                        label: 'Next',
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const VerifyOtpScreen()));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
