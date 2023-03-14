import '../models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class BaseAuthRepository{
Stream<UserModel> get user;

Future<auth.User?> signUp ({
  required String email,
  required String password,
});

Future<void> loginWithEmailAndPassword({
  required String email,
  required String password,
});

Future<void> signOut();
}