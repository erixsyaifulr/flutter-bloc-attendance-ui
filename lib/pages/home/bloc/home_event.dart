part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent() : super();
}

class HomeStart extends HomeEvent {
  @override
  List<Object?> get props => [];
}
