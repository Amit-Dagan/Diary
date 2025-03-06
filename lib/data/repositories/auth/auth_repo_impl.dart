import 'package:dartz/dartz.dart';

import '../../../domain/repositories/auth/sighin.dart';
import '../../../service_locator.dart';
import '../../models/auth/signin_user_req.dart';
import '../../sources/auth/auth_service.dart';


class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthService>().signin(signinUserReq) ;

  }

  // @override
  // Future<Either> signup(CreateUserReq createUserReq) async {
  //   return await sl<AuthFirebaseService>().signup(createUserReq) ;
  // }

}

