import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInService {
  Future<String> signIn({String email, String password});
}

class FirebaseSignIn implements SignInService {
  @override
  Future<String> signIn({String email, String password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
      return user.toString();
    } catch (e) {
      return e.toString();
    }
  }
}
