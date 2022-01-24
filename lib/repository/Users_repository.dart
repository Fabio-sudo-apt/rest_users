import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:rest_users/models/Users.dart';
import 'package:http/http.dart' as http;

import 'Repository.dart';

class UsersRepository extends ChangeNotifier implements Repository {
  String url = "https://61ec81e2f3011500174d2193.mockapi.io";
  @override
  Future<List<Users>> getUsersList() async {
    List<Users> toDataList = [];

    final uri = Uri.parse("$url/users");

    final response = await http.get(uri);

    final body = json.decode(response.body);

    for (int i = 0; i < body.length; i++) {
      toDataList.add(Users.fromJson(body[i]));
    }
    return toDataList;
  }

  @override
  Future putUsers(String? id, String name) async {
    final uri = Uri.parse("$url/users/$id");
    await http.put(uri, body: {"name": name});
  }

  @override
  Future deleteUsers(String id) async {
    final uri = Uri.parse("$url/users/$id");
    await http.delete(uri);
  }
}
