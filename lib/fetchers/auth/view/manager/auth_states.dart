
// part of 'auth__cubit.dart';
sealed class AuthStates {}

final class ValidationInitial extends AuthStates {}

final class ValidationSuccessState extends AuthStates {}
final class ValidationFailedState extends AuthStates {}
////////////////////////////////////
final class UserLoadingState extends AuthStates {}

final class UserCreatedSuccessState extends AuthStates {}
final class UserCreatedFailedState extends AuthStates {}
////////////////////////////////////////////
final class SignInSuccessState extends AuthStates {}
final class SignInFailedState extends AuthStates {
  SignInFailedState( {this.error});
   String  ? error;
}
///////////////////////////////////
final class SignedPhoneSuccessState extends AuthStates {
  String ? verificationId;
  SignedPhoneSuccessState({this.verificationId});
}
final class SignedPhoneFailedState extends AuthStates {
  String ? error;
  SignedPhoneFailedState(this.error, );
}
