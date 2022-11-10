part of 'log_in_bloc.dart';

@immutable
abstract class LogInEvent {}

class LogInUserEvent extends LogInEvent {
  final String username;
  final String password;

  LogInUserEvent(this.username, this.password);
}

class CheckLoginEvent extends LogInEvent {}

class LogOutEvent extends LogInEvent {}
