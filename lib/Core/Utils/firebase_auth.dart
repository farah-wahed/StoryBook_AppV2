import 'package:firebase_auth/firebase_auth.dart';


abstract class  FirebaseAuthentication{

  static Future<bool> createAccount(
      String emailAddress,
      String password,
      String userName,
      ) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password ,

      );
      await credential.user!.updateDisplayName(userName);
      await credential.user!.reload();
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return Future.value(false);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }

  static Future<bool> signIn(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');

      } else if (e.code == 'invalid-credential') {
        print('Wrong password provided for that user.');

      }
      return Future.value(false);
    }
  }
}