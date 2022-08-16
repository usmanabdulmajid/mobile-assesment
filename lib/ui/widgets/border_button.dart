import 'package:flutter/material.dart';
import 'package:mobile_assesment/utils/constants.dart';
import 'package:mobile_assesment/utils/extensions.dart';

class BorderButton extends StatelessWidget {
  final String label;

  final VoidCallback onTap;
  const BorderButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 50,
      child: TextButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(8),
          shadowColor:
              MaterialStateProperty.all<Color>(const Color(0xffF84E69)),
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xffF84E69)),
          foregroundColor: MaterialStateProperty.all<Color?>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kborderradius),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
