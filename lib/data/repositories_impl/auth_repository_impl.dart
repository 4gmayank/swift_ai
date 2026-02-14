import 'package:firebase_auth/firebase_auth.dart';
import 'package:swift_ai/data/service/google_auth_service.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final GoogleAuthService googleAuthService;

  AuthRepositoryImpl(this.googleAuthService);

  @override
  Future<User?> signInWithGoogle() async {
    return await googleAuthService.signInWithGoogle();
  }

  @override
  Future<void> signOut() async {
    await googleAuthService.signOut();
  }
}