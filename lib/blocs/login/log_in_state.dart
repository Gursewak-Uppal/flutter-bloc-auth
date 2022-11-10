part of 'log_in_bloc.dart';

@immutable
abstract class LogInState extends Equatable {}

class LogInInitial extends LogInState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LogInLoadingState extends LogInState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LogInErrorState extends LogInState {
  final String errorMsg;

  LogInErrorState(this.errorMsg);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMsg];
}

class LogInSuccessState extends LogInState {
  final String username;

  LogInSuccessState(this.username);

  @override
  // TODO: implement props
  List<Object?> get props => [username];
}

class LogInNeededState extends LogInState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
