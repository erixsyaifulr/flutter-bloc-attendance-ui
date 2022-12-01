part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent() : super();
}

class ProfileStart extends ProfileEvent {
  @override
  List<Object?> get props => [];
}
