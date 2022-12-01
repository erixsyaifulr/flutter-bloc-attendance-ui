part of 'attendance_bloc.dart';

abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent() : super();
}

class AttendanceStart extends AttendanceEvent {
  @override
  List<Object?> get props => [];
}
