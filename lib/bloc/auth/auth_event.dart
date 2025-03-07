abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  late final String _username;
  late final String _password;

  LoginEvent(String username, String password) {
    _username = username;
    _password = password;
  }

  String get username => _username;
  String get password => _password;
}

class LogoutEvent extends AuthEvent {}