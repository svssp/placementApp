import 'package:firebase_auth/firebase_auth.dart';

class AuthUtils {
  forgotPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
