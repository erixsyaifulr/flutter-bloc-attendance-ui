part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent() : super();
}

class SplashStarted extends SplashEvent {
  @override
  List<Object?> get props => [];
}
