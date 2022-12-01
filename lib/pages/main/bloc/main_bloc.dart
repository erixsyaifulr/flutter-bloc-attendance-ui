import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  int currentIndex = 0;

  MainBloc() : super(MainLoading()) {
    on<MainStart>(initMain);
    on<MainChange>(changePage);
  }

  FutureOr<void> initMain(MainStart event, Emitter<MainState> emit) async {
    emit(MainLoaded());
  }

  FutureOr<void> changePage(MainChange event, Emitter<MainState> emit) async {
    currentIndex = event.index!;
    if (event.index == 0) {
      emit(MainLoaded());
    }

    if (event.index == 1) {
      emit(SecondPageLoaded());
    }

    if (event.index == 2) {
      emit(ThirdPageLoaded());
    }
  }
}
