import 'package:flutter/material.dart';

Widget textfield(nameInput) {
  return TextField(
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        fillColor: const Color(0xFF343645),
        filled: true),
    style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
    controller: nameInput,
  );
}

Widget addButton(function) {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0),
    child: SizedBox(
      height: 60,
      width: 100,
      child: ElevatedButton(
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
          function;
        },
        child: const Text(
          'Add',
          style: TextStyle(fontSize: 20),
        ),
      ),
    ),
  );
}
