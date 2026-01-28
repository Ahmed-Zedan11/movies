import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/src/core/errors/app_exceptions.dart';
import 'package:movies_app/src/features/auth/data/data%20source/remote/auth_remote_data_source.dart';
import 'package:movies_app/src/features/auth/data/models/login_request.dart';
import 'package:movies_app/src/features/auth/data/models/login_response.dart';
import 'package:movies_app/src/features/auth/data/models/register_request.dart';
import 'package:movies_app/src/features/auth/data/models/register_response/register_response.dart';
import 'package:movies_app/src/config/resources/constants_manger.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.authBaseUrl));

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await dio.post(
        ApiConstants.registerEndpoint,
        data: request.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    } catch (exception) {
      String errorMessage = "An unexpected error occurred";
      if (exception is DioException) {
        errorMessage = exception.response?.data["message"];
      }
      throw RemoteException(message: errorMessage);
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await dio.post(
        ApiConstants.loginEndpoint,
        data: request.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      String errorMessage = "An unexpected error occurred";
      if (exception is DioException) {
        errorMessage = exception.response?.data["message"];
      }
      throw RemoteException(message: errorMessage);
    }
  }
}
