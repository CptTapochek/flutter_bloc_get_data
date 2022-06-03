import 'package:flutter_bloc_get_data/model/user.dart';
import 'package:flutter_bloc_get_data/services/user_api_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}