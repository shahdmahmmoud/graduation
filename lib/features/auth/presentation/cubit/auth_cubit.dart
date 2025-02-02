import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/login/login_request.dart';
import '../../data/models/login/login_response.dart';
import '../../data/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final response = await _authRepository.login(LoginRequest(email: email, password: password));
      emit(AuthSuccess(response));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final LoginResponse response;

  AuthSuccess(this.response);
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);
}