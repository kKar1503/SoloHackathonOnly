import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> register({
    required String email,
    required String password,
    // required String telegram,
    // required String nric,
    // required String type,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      User? user = result.user;

     
      // await DatabaseService(uid: user.uid).updateUserData(email, password, name,
      //     age, height, weight, bodyFatPercentage, fitnessLevel);

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

  // Future<bool> anon() async {
  //   try {
  //     await _auth.signInAnonymously();
  //     return true;
  //   } on FirebaseAuthException {
  //     return false;
  //   }
  // }

  // // get user UID
  // Future<String> getCurrentID() async {
  //   return (await _auth.currentUser).uid;
  // }

  // // get user UID
  // User getCurrentUser() {
  //   //return firebase.auth().currentUser;
  //   return _auth.currentUser;
  // }
}
