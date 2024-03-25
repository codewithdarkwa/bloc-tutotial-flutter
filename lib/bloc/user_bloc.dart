import 'package:bloc_tut/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository/repository.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<FetchUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await userRepository.fetchUser(event.username);
        emit(UserLoaded(user));
      } catch (e) {
        emit(UserError('Failed to fetch user data'));
      }
    });
  }
}
