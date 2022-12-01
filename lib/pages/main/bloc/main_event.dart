part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent() : super();
}

class MainStart extends MainEvent {
  @override
  List<Object?> get props => [];
}

class MainChange extends MainEvent {
  final int? index;

  const MainChange({this.index});

  @override
  List<Object?> get props => [index];
}
