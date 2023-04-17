import 'package:clone_social_media/data/model/auth/registerUserResModel.dart';
import 'package:clone_social_media/data/model/auth/user_register.dart';
import 'package:clone_social_media/data/provider/auth/auth_provider.dart';
import 'package:either_dart/either.dart';

class AuthRepository {
  final AuthProvider authProvider;
  AuthRepository({required this.authProvider});

  Future<Either<String, RegisterUserResModel>> registerUser(
      {required UserRegister user}) async {
    return await authProvider.registerUser(user: user);
  }
}
