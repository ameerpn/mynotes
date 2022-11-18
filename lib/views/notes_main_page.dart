import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () async {
              devtools.log("pressed");
              final shouldLogout = await showLogoutDialog(context);
              devtools.log(shouldLogout.toString());
              if (shouldLogout) {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login',
                    (_) => false,
                );
              }

            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Logout'),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.logout,
                  size: 24.0,
                ),
              ],
            ),
          ),
        ],
      ),
      body: const Text("Notes"),
    );
  }
}

Future<bool> showLogoutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout..?"),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop(false);
          }, child: const Text("Cancel"),),
          TextButton(onPressed: () {
            Navigator.of(context).pop(true);
          }, child: const Text("Logout"),),
        ],
      );
    },
  ).then((value) => value ?? false);
}
