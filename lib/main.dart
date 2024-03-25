import 'package:bloc_tut/bloc/user_bloc.dart';
import 'package:bloc_tut/data/data_provider/data_provider.dart';
import 'package:bloc_tut/data/repository/repository.dart';
import 'package:bloc_tut/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => UserBloc(userRepository: UserRepository(DataProvider())),
        child: const HomePage(),
      ),
    );
  }
}
