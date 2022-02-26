import 'package:application_frontend/utils/data.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> register({
    required String email,
    required String password,
    required String first,
    required String last,
    required String nric,
    required String type,
    required String dob,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      User user = result.user as User;
      String? uid = user.uid;

      await DataService(uid: user.uid).updateUserData(
          nric: nric,
          email: email,
          password: password,
          last: last,
          first: first,
          dob: dob,
          type: type);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return false;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return false;
  }

  Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      print(email);

      return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return false;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return false;
      }
    }
    return false;
  }

  Future<bool> logout() async {
    try {
      await _auth.signOut();
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  String getCurrentID() {
    String uuid = _auth.currentUser!.uid;
    return uuid;
  }
}
