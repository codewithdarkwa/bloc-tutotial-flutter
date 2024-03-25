import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: 'Enter username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text.trim();
                  if (username.isNotEmpty) {
                    BlocProvider.of<UserBloc>(context).add(FetchUserEvent(username));
                  }
                },
                child: const Text('Fetch User'),
              ),
              const SizedBox(height: 20),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is UserLoaded) {
                    final user = state.user;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(user.avatarUrl),
                        ),
                        const SizedBox(height: 20),
                        Text('Username: ${user.login}'),
                        const SizedBox(height: 10),
                        Text('Bio: ${user.bio}'),
                      ],
                    );
                  } else if (state is UserError) {
                    return Text('Error: ${state.errorMessage}');
                  }
                  else if(state is UserInitial){
                    return const Text('Enter username to get the details');
                  }
                  else {
                    return const Text('No user data available');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
