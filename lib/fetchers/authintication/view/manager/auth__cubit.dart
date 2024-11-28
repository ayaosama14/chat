import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../home/views/home_view.dart';

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
  singIn({required String email ,required String password}){
    // FirebaseAuth.instance.singin()
  }
/* create user in fire base */
///////////////////////////////////////////////////////////////////

  createUser(
      {formKey, required String name, required String email, required String password }) {
    if (formKey.currentState!.validate()) {
      emit(UserLoadingState());

      //call create user in firebase
      // FirebaseAuth.instance.CreateUser

      emit(UserSuccessState());
    }
    else {
      emit(UserFailedState())
      ;
    }
  }
}



