import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/src/core/errors/failure.dart';
import 'package:movies_app/src/features/auth/data/models/login_request.dart';
import 'package:movies_app/src/features/auth/domain/entity/login_entity.dart';
import 'package:movies_app/src/features/auth/domain/repositoray/auth_repo.dart';

@singleton
class LoginUseCase {
  AuthRepo authRepo;
  LoginUseCase({required this.authRepo});

  Future<Either<Failure, LoginEntity>> call(LoginRequest request) {
    return authRepo.login(request);
  }
}
