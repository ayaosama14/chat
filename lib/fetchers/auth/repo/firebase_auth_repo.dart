import 'package:chating_app/core/failer.dart';
import 'package:chating_app/fetchers/auth/data_source/firebase-auth_data_source.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseRepoAuth {
  final FireBaseAuthDataSource _fireBaseAuthDataSource = FireBaseAuthDataSource();
//call datasource
 late  final singUser;
  Future<Either<Failure, User>> singInWithEmailAndPassword(
      {required email, required password}) async {
    Either<Failure, User> singedUser = await _fireBaseAuthDataSource
        .singInWithEmailAndPassword(email: email, password: password);
    return singedUser.fold(

      (failure)=>Left(failure),
    
      (user)=>Right(user),
       
    );
  
  }
}
