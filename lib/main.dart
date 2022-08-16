import 'package:flutter/material.dart';
import 'package:mobile_assesment/ui/screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile assestment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'RobotoMono',
        scaffoldBackgroundColor: const Color(0xff3D3D3D),
      ),
      home: const AuthScreen(),
    );
  }
}
