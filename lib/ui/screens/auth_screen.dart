import 'package:flutter/material.dart';
import 'package:mobile_assesment/ui/screens/signup_view.dart';
import 'package:mobile_assesment/ui/widgets/custom_textfield.dart';
import 'package:mobile_assesment/utils/constants.dart';
import 'package:mobile_assesment/utils/extensions.dart';
import 'package:mobile_assesment/utils/spacing.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int authIndex = 0;

  @override
  Widget build(BuildContext context) {
    final left = ((context.height * 0.3) - (context.width) / 2);
    return Scaffold(
      backgroundColor: const Color(0xff3D3D3D),
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
                    left: left.abs() * -1,
                    bottom: 0,
                    width: context.width,
                    height: context.width,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffFF647C),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, -1),
                              blurRadius: 4,
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ]),
                      //alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          YMargin(context.width / 2),
                          Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF84E69),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                              const XMargin(kmediumspace),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF84E69),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const YMargin(kLargespace),
              Padding(
                padding: const EdgeInsets.only(left: kmediumspace),
                child: SizedBox(
                  width: context.width * 0.3,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                authIndex = 0;
                              });
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: authIndex == 0
                                      ? Colors.white
                                      : Colors.grey),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                authIndex = 1;
                              });
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: authIndex == 1
                                      ? Colors.white
                                      : Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      const YMargin(ksmallspace),
                      Stack(
                        children: [
                          Container(
                            width: (context.width * 0.3),
                            height: 3,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kborderradius),
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: List.generate(
                              2,
                              (index) => AnimatedContainer(
                                width: (context.width * 0.3) / 2,
                                height: 3,
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(kborderradius),
                                  color: index == authIndex
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const YMargin(kLargespace),
              Expanded(
                child: IndexedStack(
                  index: authIndex,
                  children: const [
                    Center(
                      child: Text('Login'),
                    ),
                    SignupView(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
