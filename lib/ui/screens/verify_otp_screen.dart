import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_assesment/utils/constants.dart';
import 'package:mobile_assesment/utils/extensions.dart';
import 'package:mobile_assesment/utils/spacing.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late Timer _timer;
  Duration _duration = const Duration(seconds: 60);
  bool _timercompleted = true;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void startTimer() {
    setState(() {
      _timercompleted = false;
    });
    const onesec = Duration(seconds: 1);
    _timer = Timer.periodic(onesec, (timer) {
      const reducesec = 1;
      setState(() {
        final seconds = _duration.inSeconds - reducesec;
        if (seconds < 1) {
          _timer.cancel();
          _timercompleted = true;
          _duration = const Duration(seconds: 60);
        } else {
          _duration = Duration(seconds: seconds);
        }
      });
    });
  }

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter otp sent to your email',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const YMargin(kxtralargespace),
                PinCodeTextField(
                  appContext: context,
                  length: 5,
                  onChanged: (value) {},
                  autoDismissKeyboard: true,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  obscuringCharacter: '✻',
                  textStyle: const TextStyle(color: Colors.white),
                  pinTheme: PinTheme(
                    activeColor: const Color(0xffFF647C),
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(10),
                    shape: PinCodeFieldShape.box,
                    errorBorderColor: const Color(0xFFFF5E5E),
                    selectedColor: const Color(0xffFF647C),
                    selectedFillColor: Colors.transparent,
                    disabledColor: Colors.grey,
                    inactiveColor: Colors.grey,
                    fieldWidth: 45,
                    fieldHeight: 50,
                  ),
                ),
                const YMargin(ksmallspace),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                      _timercompleted
                          ? 'Code Expired'
                          : '00:${_duration.inSeconds}',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
                const YMargin(kspace),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (_timercompleted) {
                        startTimer();
                      }
                    },
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _timercompleted
                              ? const Color(0xffFF647C)
                              : const Color(0xffFF647C).withOpacity(0.5)),
                    ),
                  ),
                ),
                const YMargin(kLargespace),
                GestureDetector(
                  onTap: () {
                    //Navigator.pushReplacementNamed(context, AppRoute.regsuccessroute);
                  },
                  child: Center(
                    child: Container(
                      height: 59,
                      width: 59,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xffFF647C),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, -2),
                            blurRadius: 4,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
