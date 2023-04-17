// import 'dart:io';

import 'package:clone_social_media/constant/constant.dart';
import 'package:clone_social_media/data/model/auth/registerUserResModel.dart';
import 'package:clone_social_media/data/model/auth/user_register.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class AuthProvider {
  final dio = Dio();
  //register user with email and password
  Future<Either<String, RegisterUserResModel>> registerUser(
      {required UserRegister user}) async {
    final FormData formData = FormData.fromMap({
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'password_confirmation': user.confirmPassword,
      'image': await MultipartFile.fromFile(user.image!.path),
    });
    try {
      final res = await dio.post(
        '$kBaseUrl/user/register',
        data: formData,
        options: Options(
            headers: {
              'Accept': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      if (res.statusCode == 200) {
        return Right(RegisterUserResModel.fromJson(res.data));
      }
      return Left(res.data['message']);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
