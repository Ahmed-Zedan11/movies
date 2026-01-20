import 'package:movies_app/src/features/auth/data/models/register_request.dart';
import 'package:movies_app/src/features/auth/data/models/register_response/register_response.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponse> register(RegisterRequest request);
}
