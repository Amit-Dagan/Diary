
import 'package:diary/data/sources/auth/auth_service.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/auth/auth_repo_impl.dart';
import 'domain/repositories/auth/sighin.dart';
import 'domain/usecase/auth/auth.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthService>(MockAuthServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());


}