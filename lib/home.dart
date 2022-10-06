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

  Widget alertdialog({required function}) {
    return AlertDialog(
      title: const Text('Update List'),
      content: Column(
        children: [
          TextField(
            controller: name,
            decoration: const InputDecoration(hintText: "Enter Name"),
          ),
          TextField(
            controller: username,
            decoration: const InputDecoration(hintText: "Enter Username"),
          ),
          TextField(
            controller: email,
            decoration: const InputDecoration(hintText: "Enter Email"),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              function;
            },
            child: const Text('Add'))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter Name',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fillColor: const Color(0xFF343645),
                      filled: true),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)),
                  controller: name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter Username',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fillColor: const Color(0xFF343645),
                      filled: true),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)),
                  controller: username,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter Email',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fillColor: const Color(0xFF343645),
                      filled: true),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)),
                  controller: email,
                ),
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
                              return Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: ListTile(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(40),
                                      bottomRight: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(25),
                                    ),
                                  ),
                                  tileColor: Colors.grey,
                                  title:
                                      Text('${snapshot.data.data[index].name}'),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${snapshot.data.data[index].username}'),
                                      Text(
                                          '${snapshot.data.data[index].email}'),
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
                                                        username:
                                                            username.text),
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
