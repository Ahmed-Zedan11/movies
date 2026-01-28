import 'package:injectable/injectable.dart';
import 'package:movies_app/src/features/auth/data/models/register_request.dart';
import 'package:movies_app/src/features/auth/domain/entity/register_entity.dart';
import 'package:movies_app/src/features/auth/domain/repositoray/auth_repo.dart';

@singleton
class RegisterUseCase {
  AuthRepo authRepo;
  RegisterUseCase({required this.authRepo});

  Future<RegisterEntity> call(RegisterRequest request) {
    return authRepo.register(request);
  }
}
