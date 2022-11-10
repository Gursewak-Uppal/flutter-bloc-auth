// Mock Bloc
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_auth/blocs/login/log_in_bloc.dart';
import 'package:flutter_bloc_auth/core/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  logInBloc();
}

void logInBloc() {
  group('LoginBloc', () {
    blocTest<LogInBloc, LogInState>(
      'when nothing entered',
      build: () => LogInBloc(),
      act: (bloc) async => bloc.add(LogInUserEvent("", "")),
      expect: () => <LogInState>[LogInLoadingState(), LogInErrorState(AppConstants.usernameRequiredMsg)],
    );
    blocTest<LogInBloc, LogInState>(
      'when password not entered',
      build: () => LogInBloc(),
      act: (bloc) async => bloc.add(LogInUserEvent("Test", "")),
      expect: () => <LogInState>[LogInLoadingState(), LogInErrorState(AppConstants.passwordRequiredMsg)],
    );
    blocTest<LogInBloc, LogInState>(
      'when password length is less then 6',
      build: () => LogInBloc(),
      act: (bloc) async => bloc.add(LogInUserEvent("Test", "abc")),
      expect: () => <LogInState>[LogInLoadingState(), LogInErrorState(AppConstants.passwordShortLengthMsg)],
    );
    blocTest<LogInBloc, LogInState>(
      'when a valid username and password',
      build: () => LogInBloc(),
      act: (bloc) async => bloc.add(LogInUserEvent("Test", "Test@123")),
      expect: () => <LogInState>[LogInLoadingState()],
    );
  });
}
