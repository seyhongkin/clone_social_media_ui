import 'package:clone_social_media/constant/constant.dart';
import 'package:clone_social_media/controller/auth/auth_controller.dart';
import 'package:clone_social_media/data/model/auth/user_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends GetView<AuthController> {
  // final controller = Get.put(AuthController());
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'Form Sign Up',
                      style: headerStyle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<AuthController>(
                        // init: controller,
                        builder: (_) {
                      if (controller.image != null) {
                        return Stack(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: FileImage(controller.image!),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: IconButton(
                                  icon: const Icon(Icons.camera_alt_outlined),
                                  onPressed: () {
                                    controller.pickImage();
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return Stack(
                        children: [
                          const CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: IconButton(
                                icon: const Icon(Icons.camera_alt_outlined),
                                onPressed: () {
                                  controller.pickImage();
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                            },
                            controller: nameController,
                            decoration: const InputDecoration(
                              hintText: "Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!value.isEmail) {
                                return 'Please enter a valid email';
                              }
                            },
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: "Email",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                            },
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "Password",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                            },
                            controller: confirmPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "Confirm Password",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            UserRegister userRegister = UserRegister(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                                image: Get.find<AuthController>().image);
                            Get.find<AuthController>()
                                .registerUser(user: userRegister);

                            // print(nameController.text);
                            // print(emailController.text);
                            // print(passwordController.text);
                            // print(confirmPasswordController.text);
                          }
                        },
                        child: const Text('Sign Up')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                        ),
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('Login')),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
