import 'package:flutter/material.dart';
import 'package:rest_users/controllers/ApiData.dart';
import 'package:provider/src/provider.dart';
import 'package:rest_users/models/Users.dart';

import 'HomeEditor.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiData api = context.watch<ApiData>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest Users"),
        centerTitle: true,
        backgroundColor: Colors.orange[100],
      ),
      body: FutureBuilder<List<Users>>(
        future: api.fetchList(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                    child: Text(
                  "Error no carregamento do dados...",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFFFFE0B2),
                  ),
                ));
              } else {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final user = snapshot.data?[index];
                      return Container(
                        height: 90.0,
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Icon(Icons.person),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text("${user?.name}"),
                            ),
                            Expanded(
                              flex: 3,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              HomeEditor('${user?.id}', api),
                                        ),
                                      );
                                    },
                                    child: buldContaner(
                                      "Edit",
                                      const Color(0xFFE1BEE7),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      api.deleteUser('${user?.id}');
                                    },
                                    child: buldContaner(
                                      "Del",
                                      const Color(0xFFFFCDD2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 0.5,
                        height: 0.5,
                      );
                    },
                    itemCount: snapshot.data?.length ?? 0);
              }
          }
        },
      ),
    );
  }

  Container buldContaner(String texto, Color cor) {
    return Container(
      width: 50.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
