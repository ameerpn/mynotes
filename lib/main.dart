import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/views/login_page.dart';
import 'package:mynotes/views/notes_main_page.dart';
import 'package:mynotes/views/register_page.dart';
import 'package:mynotes/views/verify_email_page.dart';
import 'dart:developer' as devtools show log;

import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        loginRoute: (context) => LoginView(),
        registerRoute: (context) => RegisterView(),
        verifyEmailRoute: (context) => VerifyEmailView(),
        notesRoute: (context) => NotesView(),
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                if (user.emailVerified){
                  devtools.log("Email verified");
                }else {
                  devtools.log(user.toString());
                  return const VerifyEmailView();
                }
              }else {
                return const LoginView();
              }
              return const NotesView();
            default:
              return const Text("Loading...");
          }
        },
      );
  }
}

