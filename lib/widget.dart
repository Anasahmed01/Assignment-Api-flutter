import 'package:flutter/material.dart';

showAlertDialog(
  BuildContext context,
  removeFunction,
) {
  // Create button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      removeFunction;
      Navigator.of(context).pop();
    },
  );
  Widget cancleButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Alert!"),
    content: const Text("Are you sure Delete this "),
    actions: [
      okButton,
      cancleButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
