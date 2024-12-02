import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../home/home/home_view.dart';

import 'auth_states.dart';


class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(ValidationInitial());


  checkFormValed({formKey, context}) {
    if (formKey.currentState?.validate() == true) {
      emit(ValidationSuccessState());
      // sing in firebase


      Navigator.pushNamed(context, HomeView.id);
      //sing in firebase with email& password


    } else {
      // AppSnackBar.failure(context);
      emit(ValidationFailedState());
    }
  }
  singIn({required String email ,required String password}) async {
    // FirebaseAuth.instance.singin()
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
/* create user in fire base */
///////////////////////////////////////////////////////////////////

  createUser(
      {formKey, required String name, required String email, required String password }) async {
    // if (formKey.currentState?.validate()) {
      emit(UserLoadingState());

      //call create user in firebase
      try {
        FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        emit(UserCreatedSuccessState());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          emit(UserCreatedFailedState());
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          emit(UserCreatedFailedState());

        }
      } catch (e) {
        print(e);
      }


    // }
    // else {
    //   emit(UserCreatedFailedState())
    //   ;
    // }
  }
}

