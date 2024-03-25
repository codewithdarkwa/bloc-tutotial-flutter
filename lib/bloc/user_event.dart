part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class FetchUserEvent extends UserEvent {
  final String username;

  FetchUserEvent(this.username);
}
