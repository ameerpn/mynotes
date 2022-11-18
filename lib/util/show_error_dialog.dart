import 'package:flutter/material.dart';

Future<void> showErrorDialog(BuildContext context, String title, String message) {
  return showDialog(context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
  );
}