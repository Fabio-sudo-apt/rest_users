import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:rest_users/controllers/ApiData.dart';
import 'package:rest_users/views/HomePage.dart';

class HomeEditor extends StatelessWidget {
  final String? _id;
  final ApiData _api;
  const HomeEditor(this._id, this._api, {Key? key}) : super(key: key);

  get id => _id;
  get api => _api;

  @override
  Widget build(BuildContext context) {
    final _nomeController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest Users"),
        centerTitle: true,
        backgroundColor: Colors.orange[100],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Nome",
              ),
              controller: _nomeController,
            ),
            Divider(),
            RaisedButton(
              onPressed: () {
                String nomeUpdate = _nomeController.text;
                api.updateUser(id, nomeUpdate).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 800),
                      content: Text("Nome alterado..."),
                    ),
                  );
                });
              },
              child: const Text(
                "Update",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.orange[100],
            )
          ],
        ),
      )),
    );
  }
}
