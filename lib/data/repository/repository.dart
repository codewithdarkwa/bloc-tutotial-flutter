import 'package:bloc_tut/data/data_provider/data_provider.dart';

import '../../model/user.dart';

class UserRepository {
  final DataProvider dataProvider;

  UserRepository(this.dataProvider);

  Future<User> fetchUser(String username) async {
    try {
      return await dataProvider.fetchUser(username);
    } catch (err) {
      throw Exception('Failed to fetch user data: $err');
    }
  }
}
