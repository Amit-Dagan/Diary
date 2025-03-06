import 'package:dartz/dartz.dart';

import '../../models/auth/signin_user_req.dart';

abstract class AuthService {

  Future<Either> signin(SigninUserReq signinUserReq);
  //Future<Either> signup(CreateUserReq createUserReq);
}

class MockAuthServiceImpl extends AuthService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return const Right('Success');
  }
}
