import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<GoogleSignInAccount?> _signIn() async {
    try {
      await _googleSignIn.initialize();
      GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();

      // re-sign in
      // final GoogleSignInAccount? googleUser = await _googleSignIn.attemptLightweightAuthentication( reportAllExceptions: true);

      return googleUser;
    } catch (_) {
      return null;
    }
  }

  Future<User?> signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await _signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.idToken,
      // Todo: Need to fetch token from authorization scope
      idToken: googleAuth.idToken,
    );

    final userCredential = await _auth.signInWithCredential(credential);

    return userCredential.user;
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
