import 'dart:io';

import 'package:clone_social_media/data/model/auth/user_register.dart';
import 'package:clone_social_media/data/repository/auth/auth_repository.dart';
import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});
  File? image;
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    }
  }

  //register user
  void registerUser({required UserRegister user}) async {
    final res = authRepository.registerUser(
        user: UserRegister(
      name: user.name,
      email: user.email,
      password: user.password,
      confirmPassword: user.confirmPassword,
      image: user.image,
    ));
    res.fold(((left) {
      Get.snackbar("Error Occured", left.toString());
      print(left.toString());
    }), (right) => Get.snackbar("Success", "User Registered Successfully"));
  }
}
