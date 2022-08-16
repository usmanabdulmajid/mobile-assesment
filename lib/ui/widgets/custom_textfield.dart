import 'package:flutter/material.dart';
import 'package:mobile_assesment/utils/constants.dart';
import 'package:mobile_assesment/utils/spacing.dart';

class CustomTextfield extends StatefulWidget {
  final String label;
  final Color? labelColor;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final bool password;
  const CustomTextfield(
      {Key? key,
      required this.label,
      this.labelColor,
      this.controller,
      this.textInputType,
      this.validator,
      this.password = false})
      : super(key: key);

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool obscureText = false;
  Color get _labelColor => widget.labelColor ?? const Color(0xffFF647C);
  // bool get hasError =>
  //     widget.validator?.call(widget.controller?.text)?.isNotEmpty ?? false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: _labelColor,
          ),
        ),
        const YMargin(ksmallspace),
        TextFormField(
          cursorColor: Colors.white,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          validator: widget.validator,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.white),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(
                  ksmallspace, ktinyspace, ktinyspace, ktinyspace),
              fillColor: const Color(0xff373737),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(ksmallspace),
                  borderSide: const BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(ksmallspace),
                  borderSide: const BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(ksmallspace),
                  borderSide: const BorderSide(color: Colors.transparent)),
              suffixIcon: widget.password
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                    )
                  : null),
        ),
      ],
    );
  }
}
