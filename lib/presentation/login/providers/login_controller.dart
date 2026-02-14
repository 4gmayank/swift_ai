import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_ai/di.dart';
import 'package:swift_ai/domain/usecases/google_sign_in_use_case.dart';

class LoginController extends AsyncNotifier<User?> {
  late final SignInGoogleUseCase _signInWithGoogle;

  @override
  Future<User?> build() async {
    _signInWithGoogle = ref.read(signInGoogleProvider);
    return null;
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return await _signInWithGoogle.call();
    });
  }
}

final loginControllerProvider = AsyncNotifierProvider<LoginController, User?>(
  LoginController.new,
);
