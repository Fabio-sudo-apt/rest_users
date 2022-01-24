import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_users/controllers/ApiData.dart';
import 'package:rest_users/repository/Users_repository.dart';
import 'package:rest_users/views/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Rest Users",
      home: ChangeNotifierProvider(
        child: const HomePage(),
        create: (_) => ApiData(UsersRepository()),
      ),
    );
  }
}
