import 'package:chating_app/core/app_const.dart';
import 'package:chating_app/core/failer.dart';
import 'package:chating_app/fetchers/auth/data_source/auth_data_source.dart';

import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

////////////////////// createUserWithEmailAndPassword//////////////////////
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

////////////////////////////signInWithGoogle/////////////////
  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    AppConst.google_access_token = credential.accessToken!;
    AppConst.google_id_token = credential.idToken!;
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
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
