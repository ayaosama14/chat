import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(ValidationInitial());
  final supabase = Supabase.instance.client;

  singInWithEmail(
      {required formKey,
      required String email,
      required String password}) async {
    //check validation

    if (formKey.currentState?.validate() == true) {
      try {
        await supabase.auth
            .signInWithPassword(email: email, password: password);
        emit(LoginUserSuccessState());
      } catch (e) {
        emit(LoginUserFailedState(error: e.toString()));
      }
    }
  }

  Future<AuthResponse> signInWithGoogle() async {
    const webClientId =
        '59022365006-49eqa5ni3vhfftb2n5vh0ck5pl47qa7r.apps.googleusercontent.com';
    const List<String> scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ];
    final GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId: webClientId,
      scopes: scopes,
    );
    final googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;


    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }
    // return supabase.auth.signInWithIdToken(
    //   provider: OAuthProvider.google,
    //   idToken: idToken,
    //   accessToken: accessToken,
    // );
    return supabase.auth.signInWithIdToken(
      provider: Provider.google, // Use the enum or constant defined in the library
      idToken: idToken,
      accessToken: accessToken,
    );

  }
/* create user in fire base */
///////////////////////////////////////////////////////////////////

// createUser(
//     {formKey, required String name, required String email, required String password }) async {
//   // if (formKey.currentState?.validate()) {
//     emit(UserLoadingState());
//
//     //call create user in firebase
//     try {
//       FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//
//       final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       emit(UserCreatedSuccessState());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//         emit(UserCreatedFailedState());
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//         emit(UserCreatedFailedState());
//
//       }
//     } catch (e) {
//       print(e);
//     }
//
//
//   // }
//   // else {
//   //   emit(UserCreatedFailedState())
//   //   ;
//   // }
// }
// }
}
