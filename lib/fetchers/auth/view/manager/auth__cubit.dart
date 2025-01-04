import 'package:bloc/bloc.dart';
import 'package:chating_app/fetchers/auth/data_source/firebase-auth_data_source.dart';
import 'package:chating_app/fetchers/auth/repo/firebase_auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  //use repo
  AuthCubit() : super(ValidationInitial());

  final FireBaseRepoAuth _fireBaseRepoAuthInstance = FireBaseRepoAuth();
  singInEmailAndPassword(
      {required String email, required String password}) async {
    emit(UserLoadingState());
    final result = await _fireBaseRepoAuthInstance.singInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failer) => emit(
        SignInFailedState(error: failer.failerMessage),
      ),
      (user) => emit(
        SignInSuccessState(),
      ),
    );
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      UserCredential userCred =
          await FireBaseAuthDataSource().signInWithGoogle();
      emit(SignedGoogleSuccessState());
      return userCred;
    } catch (e) {
      emit(SignedGoogleFailedState());
      return null;
    }
  }
}
