import 'package:chating_app/core/failer.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource {
  Future<Either<Failure, User>> singInWithEmailAndPassword(
      {required String email, required String password});

  

  Future<Either<Failure, User>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });


   Future<UserCredential>  signInWithGoogle();

  Future<Either<Failure, User>> signInWithPhoneNumber({String? phoneNumber});
  signOut();
}
