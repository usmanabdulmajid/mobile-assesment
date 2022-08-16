import 'package:flutter/material.dart';
import 'package:mobile_assesment/ui/widgets/border_button.dart';
import 'package:mobile_assesment/ui/widgets/custom_textfield.dart';
import 'package:mobile_assesment/utils/constants.dart';
import 'package:mobile_assesment/utils/extensions.dart';
import 'package:mobile_assesment/utils/spacing.dart';
import 'package:mobile_assesment/utils/validator.dart';

class NewPasswordScreen extends StatelessWidget with Validator {
  const NewPasswordScreen({Key? key}) : super(key: key);
  static final _formkey = GlobalKey<FormState>();
  static final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                children: [
                  CustomTextfield(
                    label: 'Enter New Password',
                    password: true,
                    textInputType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    validator: validatePassword,
                  ),
                  const YMargin(kspace),
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
                  const YMargin(kxtralargespace),
                  BorderButton(
                    label: 'Save',
                    onTap: () {
                      if (_formkey.currentState!.validate()) {}
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
