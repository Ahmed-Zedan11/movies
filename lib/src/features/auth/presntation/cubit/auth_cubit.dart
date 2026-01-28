import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/src/features/auth/data/models/login_request.dart';
import 'package:movies_app/src/features/auth/data/models/register_request.dart';
import 'package:movies_app/src/features/auth/domain/use_cases/login_use_case.dart';
import 'package:movies_app/src/features/auth/domain/use_cases/register_use_case.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.registerUseCase, required this.loginUseCase})
    : super(AuthIntialState());

  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;

  void register(RegisterRequest request) async {
    try {
      emit(AuthLoadingState());
      await registerUseCase(request);
      emit(RegisterSuccessState());
    } catch (exception) {
      emit(AuthErrorState(message: exception.toString()));
    }
  }

  void login(LoginRequest request) async {
    emit(AuthLoadingState());
    final result = await loginUseCase(request);
    result.fold(
      (failure) {
        emit(AuthErrorState(message: failure.message));
      },
      (response) {
        emit(LoginSuccessState());
      },
    );
  }
}

class AuthState {}

class AuthIntialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class LoginSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState({required this.message});
}
