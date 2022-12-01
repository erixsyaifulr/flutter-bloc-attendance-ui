import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginStart>((event, emit) => null);
    on<LoginSubmit>(submitLogin);
  }

  FutureOr<void> submitLogin(
      LoginSubmit event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    await Future.delayed(const Duration(seconds: 3), () {
      if (event.email == "test@gmail.com" && event.password == "12345") {
        emit(LoginSuccess());
      } else {
        emit(const LoginFailed(
          message: "Email/password salah !",
        ));
      }
    });
  }
}
