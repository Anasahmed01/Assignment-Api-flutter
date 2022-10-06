import 'package:assignmentapi/model.dart';
import 'package:assignmentapi/services.dart';

import 'package:flutter/material.dart';

class Homeapp extends StatefulWidget {
  const Homeapp({super.key});

  @override
  State<Homeapp> createState() => _HomeappState();
}

class _HomeappState extends State<Homeapp> {
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  clear() {
    setState(() {
      name.clear();
      username.clear();
      email.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Name',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: const Color(0xFF343645),
                    filled: true),
                style:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                controller: name,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Username',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: const Color(0xFF343645),
                    filled: true),
                style:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                controller: username,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Email',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: const Color(0xFF343645),
                    filled: true),
                style:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                controller: email,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF343645),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                onPressed: () {
                  addUser(
                    Data(
                        name: name.text,
                        username: username.text,
                        email: email.text),
                  );
                  clear();
                },
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                    future: getuser(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                tileColor: Colors.grey,
                                title:
                                    Text('${snapshot.data.data[index].name}'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '${snapshot.data.data[index].username}'),
                                    Text('${snapshot.data.data[index].email}'),
                                  ],
                                ),
                                trailing: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              updateUser(
                                                  model: Data(
                                                      name: name.text,
                                                      email: email.text,
                                                      username: username.text),
                                                  id: snapshot
                                                      .data.data[index].id);
                                            });
                                          },
                                          icon: const Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              deleteUser(
                                                  id: snapshot
                                                      .data.data[index].id);
                                            });
                                          },
                                          icon: const Icon(
                                              Icons.delete_outline_rounded)),
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
