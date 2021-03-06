import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_shop/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return MaterialApp(
      title: 'My Shop',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
