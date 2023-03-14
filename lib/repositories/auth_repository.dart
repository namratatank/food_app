import 'package:firebase_auth/firebase_auth.dart';

import 'package:food_app/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'base_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthRepository extends BaseAuthRepository {
  final auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignin;

  AuthRepository({auth.FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance,
        _googleSignin = googleSignIn ?? GoogleSignIn();

  var currentUser = UserModel.empty;

  @override
  Stream<UserModel> get user {
    return _firebaseAuth.authStateChanges().map((event) {
      final user = event == null ? UserModel.empty : event.toUser;
      currentUser = user;
      return user;
    });
  }

  @override
  Future<User?> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on auth.FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (_) {}
  }

  @override
  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    } catch (_) {}
  }

  Future<auth.User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignin.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
    await _firebaseAuth.signInWithCredential(credential);
    return _firebaseAuth.currentUser!;
  }

  @override
  Future<void> signOut() async {
    try {
      await Future.wait([_firebaseAuth.signOut()]);
      _googleSignin.signOut();
    } catch (_) {}
  }
}

extension on auth.User {
  UserModel get toUser {
    return UserModel(
        id: uid,
        fullName: displayName ?? '',
        email: email ?? '',
        photo: photoURL ?? '');
  }
}
