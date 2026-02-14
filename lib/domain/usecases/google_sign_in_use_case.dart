import 'package:firebase_auth/firebase_auth.dart';
import '../repositories/auth_repository.dart';

class SignInGoogleUseCase {
  final AuthRepository repository;

  SignInGoogleUseCase(this.repository);

  Future<User?> call() async {
    return await repository.signInWithGoogle();
  }
}
