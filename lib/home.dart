import 'package:assignmentapi/services.dart';
import 'package:flutter/material.dart';

class Homeapp extends StatefulWidget {
  const Homeapp({super.key});

  @override
  State<Homeapp> createState() => _HomeappState();
}

class _HomeappState extends State<Homeapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getuser(),
                builder: (context, AsyncSnapshot snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('${snapshot.data.data[index].name}'),
                          subtitle:
                              Text('${snapshot.data.data[index].username}'),
                          leading: IconButton(
                              onPressed: () {
                                setState(() {
                                  deleteUser();
                                });
                              },
                              icon: const Icon(Icons.delete_outline_rounded)),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
