import 'package:chating_app/core/failer.dart';
import 'package:chating_app/fetchers/auth/data_source/auth_data_source.dart';

import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthDataSource extends AuthDataSource {
  FirebaseAuth firebaseInst = FirebaseAuth.instance;

  @override
  Future<Either<Failure, User>> singInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await firebaseInst.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(credential.user!);
    } catch (e) {
      return Left(Failure(failerMessage: e.toString()));
    }
  }

  

 
  @override
  Future<Either<Failure, User>> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await firebaseInst.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(credential.user!);
    } catch (e) {
      return Left(
        Failure(
          failerMessage: e.toString(),
        ),
      );
    }
  }


















   @override
  Future<Either<Failure, User>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signInWithPhoneNumber({String? phoneNumber}) {
    // TODO: implement signInWithPhoneNumber
    throw UnimplementedError();
  }

  @override
  signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

}
