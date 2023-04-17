import 'dart:io';

class UserRegister {
  String name;
  String email;
  String password;
  String confirmPassword;
  File? image;

  UserRegister({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.image,
  });
}
