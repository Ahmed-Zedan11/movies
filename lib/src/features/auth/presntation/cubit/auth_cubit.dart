import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/src/features/auth/data/models/register_request.dart';
import 'package:movies_app/src/features/auth/repositoray/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthIntialState());

  AuthRepo authRepo;

  void register(RegisterRequest request) async {
    try {
      emit(AuthLoadingState());
      await authRepo.register(request);
      emit(AuthSuccessState());
    } catch (exception) {
      emit(AuthErrorState(message: exception.toString()));
    }
  }
}

class AuthState {}

class AuthIntialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState({required this.message});
}
