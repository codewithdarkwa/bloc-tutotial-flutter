import 'package:flutter/foundation.dart';
import 'package:bloc_tut/model/user.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);
}

class UserError extends UserState {
  final String errorMessage;

  UserError(this.errorMessage);
}
