import 'package:clone_social_media/binding/auth/auth_binding.dart';
import 'package:clone_social_media/view/screen/auth/login_screen.dart';
import 'package:clone_social_media/view/screen/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
            name: '/login', page: () => LoginScreen(), binding: AuthBinding()),
        GetPage(
            name: '/signup',
            page: () => SignupScreen(),
            binding: AuthBinding()),
      ],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}
