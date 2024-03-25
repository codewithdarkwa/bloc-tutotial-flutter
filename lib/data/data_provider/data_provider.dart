import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc_tut/model/user.dart';

class DataProvider {
  Future<User> fetchUser(String username) async {
    final apiUrl = "https://api.github.com/users/$username";

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> userData = jsonDecode(response.body);
        return User.fromJson(userData);
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }
}
