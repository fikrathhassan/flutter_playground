import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/bloc/auth/auth_event.dart';
import 'package:flutter_playground/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
    on<LogoutEvent>(_onLogoutEvent);
  }

  // Handle LoginEvent
  Future<void> _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await Future.delayed(Duration(seconds: 2));
    if (event.username == 'user' && event.password == 'password') {
      emit(AuthAuthenticated(username: event.username));
    } else {
      emit(AuthError(message: 'Invalid username or password'));
    }
  }

  // Handle LogoutEvent
  Future<void> _onLogoutEvent(
      LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthUnauthenticated());
  }
}
