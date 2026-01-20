import 'package:dio/dio.dart';
import 'package:movies_app/src/features/auth/data/data%20source/remote/auth_remote_data_source.dart';
import 'package:movies_app/src/features/auth/data/models/register_request.dart';
import 'package:movies_app/src/features/auth/data/models/register_response/register_response.dart';
import 'package:movies_app/src/config/resources/constants_manger.dart';

class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.authBaseUrl));
  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    final response = await dio.post(
      ApiConstants.registerEndPioint,
      data: request.toJson(),
    );
    return RegisterResponse.fromJson(response.data);
  }
}
