import 'package:clone_social_media/controller/auth/auth_controller.dart';
import 'package:clone_social_media/data/provider/auth/auth_provider.dart';
import 'package:clone_social_media/data/repository/auth/auth_repository.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(
        authRepository: AuthRepository(authProvider: AuthProvider())));
  }
}
