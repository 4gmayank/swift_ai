import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_ai/domain/usecases/google_sign_in_use_case.dart';

import 'data/repositories_impl/auth_repository_impl.dart';
import 'data/service/google_auth_service.dart';


/**
 * Service
 */
final googleAuthServiceProvider = Provider((ref) => GoogleAuthService());


/**
 * Repository
 */
final authRepositoryProvider = Provider(
  (ref) => AuthRepositoryImpl(ref.read(googleAuthServiceProvider)),
);


/**
 * UserCase
 */
final signInGoogleProvider = Provider(
  (ref) => SignInGoogleUseCase(ref.read(authRepositoryProvider)),
);
