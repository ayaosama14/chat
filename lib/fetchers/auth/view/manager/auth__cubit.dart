import 'package:bloc/bloc.dart';
import 'package:chating_app/core/failer.dart';
import 'package:chating_app/fetchers/auth/repo/firebase_auth_repo.dart';
import 'package:chating_app/fetchers/auth/repo/firebase_auth_repo.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  //use repo
  AuthCubit() : super(ValidationInitial());

  // final supabase = Supabase.instance.client;
  FirebaseAuth auth = FirebaseAuth.instance;
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
}
