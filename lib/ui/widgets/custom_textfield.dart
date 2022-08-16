import 'package:flutter/material.dart';
import 'package:mobile_assesment/utils/constants.dart';
import 'package:mobile_assesment/utils/extensions.dart';
import 'package:mobile_assesment/utils/spacing.dart';

class CustomTextfield extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final TextEditingController? controller;
  const CustomTextfield(
      {Key? key, required this.label, this.labelColor, this.controller})
      : super(key: key);
  Color get _labelColor => labelColor ?? const Color(0xffF84E69);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: _labelColor,
          ),
        ),
        const YMargin(ksmallspace),
        Container(
          width: context.width,
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: ksmallspace),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ktinyspace),
            color: const Color(0xff373737),
          ),
          alignment: Alignment.center,
          child: TextFormField(
            cursorColor: Colors.white,
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration.collapsed(hintText: ''),
          ),
        ),
      ],
    );
  }
}
