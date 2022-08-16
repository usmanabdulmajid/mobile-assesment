import 'package:flutter/material.dart';
import 'package:mobile_assesment/ui/widgets/border_button.dart';
import 'package:mobile_assesment/ui/widgets/custom_textfield.dart';
import 'package:mobile_assesment/utils/constants.dart';
import 'package:mobile_assesment/utils/extensions.dart';
import 'package:mobile_assesment/utils/spacing.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kmediumspace),
            child: Column(
              children: [
                const CustomTextfield(label: 'Enter New Password'),
                const YMargin(kspace),
                const CustomTextfield(label: 'Confirm Password'),
                const YMargin(kxtralargespace),
                BorderButton(
                  label: 'Save',
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
