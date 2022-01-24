import 'package:rest_users/models/Users.dart';

abstract class Repository {
  Future<List<Users>> getUsersList();
  Future putUsers(String id, String name);
  Future deleteUsers(String id);
}
