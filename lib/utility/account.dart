import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_list_sample/database/user_db.dart';
import 'package:todo_list_sample/model/user_model.dart';

abstract class IAccount {
  Future<bool> signInWithGoogle();
  Future<bool> signInWithApple();
  Future<bool> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password});
  Future<void> changePassword({required String newPassword});
  Future<void> deleteAccount();

  User? get currentUser;
  bool get isSignedIn => currentUser != null;
}

class Account implements IAccount {
  static final Account _instance = Account._internal();

  factory Account() => _instance;

  Account._internal() : _auth = FirebaseAuth.instance;

  FirebaseAuth _auth;

  Future<void> _checkUserInDatabase() async {
    try {
      await UserDB.instance.query(_auth.currentUser!.uid);
    } catch (e) {
      await UserDB.instance.add(UserModel(
        id: _auth.currentUser!.uid,
        name: _auth.currentUser!.displayName ?? '',
        headshotId: '',
      ));
    }
  }

  @override
  Future<bool> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return false;
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);

      // try query user in database, if not exist, create new user
      await _checkUserInDatabase();

      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  @override
  Future<bool> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final credential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      await _auth.signInWithCredential(credential);

      // try query user in database, if not exist, create new user
      await _checkUserInDatabase();

      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  @override
  Future<bool> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await _auth.signInWithCredential(credential);

      // try query user in database, if not exist, create new user
      await _checkUserInDatabase();

      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  @override
  Future<bool> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // try query user in database, if not exist, create new user
      await _checkUserInDatabase();

      return credential.user != null;
    } on FirebaseAuthException {
      return false;
    }
  }

  @override
  Future<void> changePassword({required String newPassword}) async {
    await _auth.currentUser!.updatePassword(newPassword);
  }

  @override
  Future<void> deleteAccount() async {
    await _auth.currentUser!.delete();
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  User? get currentUser => _auth.currentUser;

  @override
  bool get isSignedIn => currentUser != null;
}
