import 'package:flutter/widgets.dart';
import 'package:rest_users/models/Users.dart';
import 'package:rest_users/repository/Repository.dart';

class ApiData extends ChangeNotifier {
  final Repository _repository;

  ApiData(this._repository);

  Future<List<Users>> fetchList() async {
    return _repository.getUsersList();
  }

  updateUser(String id, String name) async {
    await _repository.putUsers(id, name);
    notifyListeners();
  }

  deleteUser(String id) async {
    await _repository.deleteUsers(id);
    notifyListeners();
  }
}
