import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  //todo:single turn
  AuthHelper._();
  static final AuthHelper authHelper = AuthHelper._();
  FirebaseAuth auth = FirebaseAuth.instance;

  //todo: Anonymous Login
  Future<Map<String, dynamic>> anonymous() async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await auth.signInAnonymously();
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }
}
