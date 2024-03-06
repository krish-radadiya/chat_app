import 'package:chat_app/modules/screens/Loginscreen/model/sign-up-model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  //todo:single turn
  AuthHelper._();

  static final AuthHelper authHelper = AuthHelper._();
  static GoogleSignIn googleSignIn = GoogleSignIn();
  static FirebaseAuth auth = FirebaseAuth.instance;

  //todo: Anonymous Login

  Future<Map<String, dynamic>> signInAnonymous() async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await auth.signInAnonymously();
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  //todo: SignUP With Email Pass
  Future<Map<String, dynamic>> signUp(
      {required SignUpModel signUpModel}) async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: signUpModel.email, password: signUpModel.password);
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  //todo:login with email password
  Future<Map<String, dynamic>> login({required SignUpModel signUpModel}) async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: signUpModel.email,
        password: signUpModel.password,
      );
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  //todo: login with googleId
  Future<Map<String, dynamic>> signInWithGoogle() async {
    Map<String, dynamic> res = {};
    try {
      //
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      //
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      //
      final cradential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      //
      UserCredential userCredential =
          await auth.signInWithCredential(cradential);
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  //todo: Sign Out
  Future<void> signOut() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }

  anonymous() {}
}
