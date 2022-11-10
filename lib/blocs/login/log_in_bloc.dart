import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_auth/core/prefs_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInInitial()) {
    on<LogInUserEvent>(_handleLoginUserEvent);
    on<CheckLoginEvent>(_handleCheckLoginEvent);
    on<LogOutEvent>(_handleLogOutEvent);

  }

  FutureOr<void> _handleLoginUserEvent(LogInUserEvent event, Emitter<LogInState> emit) async {
    emit(LogInLoadingState());
    if (event.username == "") {
      emit(LogInErrorState(AppConstants.usernameRequiredMsg));
    } else if (event.password == "") {
      emit(LogInErrorState(AppConstants.passwordRequiredMsg));
    } else if (event.password.length < 6) {
      emit(LogInErrorState(AppConstants.passwordShortLengthMsg));
    } else {
      final prefs = await SharedPreferences.getInstance();

      prefs.setString(PrefsConstants.username, event.username);

      emit(LogInSuccessState(event.username));
    }
  }

  FutureOr<void> _handleCheckLoginEvent(CheckLoginEvent event, Emitter<LogInState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString(PrefsConstants.username);

    if ((username ?? "").isEmpty) {
      emit(LogInNeededState());
    } else {
      emit(LogInSuccessState(username!));
    }
  }

  FutureOr<void> _handleLogOutEvent(LogOutEvent event, Emitter<LogInState> emit) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(PrefsConstants.username);
  }
}
