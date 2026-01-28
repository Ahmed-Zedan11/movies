import 'package:dartz/dartz.dart';
import 'package:movies_app/src/core/errors/failure.dart';
import 'package:movies_app/src/features/auth/data/models/login_request.dart';
import 'package:movies_app/src/features/auth/data/models/register_request.dart';
import 'package:movies_app/src/features/auth/domain/entity/login_entity.dart';
import 'package:movies_app/src/features/auth/domain/entity/register_entity.dart';

abstract class AuthRepo {
  Future<RegisterEntity> register(RegisterRequest request);
  Future<Either<Failure, LoginEntity>> login(LoginRequest request);
}
