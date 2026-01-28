import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/src/core/errors/app_exceptions.dart';
import 'package:movies_app/src/core/errors/failure.dart';
import 'package:movies_app/src/features/auth/data/data%20source/local/auth_local_data_source.dart';
import 'package:movies_app/src/features/auth/data/data%20source/remote/auth_remote_data_source.dart';
import 'package:movies_app/src/features/auth/data/models/login_request.dart';
import 'package:movies_app/src/features/auth/data/models/register_request.dart';
import 'package:movies_app/src/features/auth/domain/entity/login_entity.dart';
import 'package:movies_app/src/features/auth/domain/entity/register_entity.dart';
import 'package:movies_app/src/features/auth/domain/repositoray/auth_repo.dart';

@Singleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  AuthRepoImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });
  @override
  Future<RegisterEntity> register(RegisterRequest request) async {
    final response = await authRemoteDataSource.register(request);
    return response.toEntity();
  }

  @override
  Future<Either<Failure, LoginEntity>> login(LoginRequest request) async {
    try {
      final loginResponse = await authRemoteDataSource.login(request);
      await authLocalDataSource.saveToken(loginResponse.accessToken);
      return right(loginResponse.toEntity());
    } on AppExceptions catch (exception) {
      return left(Failure(message: exception.message));
    }
  }
}
