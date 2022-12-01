part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainLoading extends MainState {
  @override
  List<Object?> get props => [];
}

class MainLoaded extends MainState {
  @override
  List<Object?> get props => [];
}

class SecondPageLoaded extends MainState {
  @override
  List<Object?> get props => [];
}

class ThirdPageLoaded extends MainState {
  @override
  List<Object?> get props => [];
}
