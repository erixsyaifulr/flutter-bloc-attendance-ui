import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashStarted>(initSplash);
  }

  FutureOr<void> initSplash(
      SplashStarted event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(seconds: 2), () {
      emit(SplashEnded());
    });
  }
}
