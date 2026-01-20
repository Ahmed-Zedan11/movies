import 'package:movies_app/src/features/auth/data/data%20source/remote/auth_remote_data_source.dart';
import 'package:movies_app/src/features/auth/data/models/register_request.dart';
import 'package:movies_app/src/features/auth/data/models/register_response/register_response.dart';
import 'package:movies_app/src/features/auth/repositoray/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl({required this.authRemoteDataSource});
  @override
  Future<RegisterResponse> register(RegisterRequest request) {
    return authRemoteDataSource.register(request);
  }
}
