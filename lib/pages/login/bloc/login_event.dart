part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent() : super();
}

class LoginStart extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class LoginSubmit extends LoginEvent {
  final String? email;
  final String? password;
  const LoginSubmit({
    this.email,
    this.password,
  });
  @override
  List<Object?> get props => [];
}
