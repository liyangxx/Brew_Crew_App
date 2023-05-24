import 'package:brew_crew_app/models/myuser.dart';
import 'package:brew_crew_app/screens/wrapper.dart';
import 'package:brew_crew_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDx8wRTsHcwRzHSCzaFyFwUB8EDzI8lvfk",
          appId: "1:850992261891:android:33771423dee82adafe9736",
          messagingSenderId: "850992261891",
          projectId: "brew-crew-a41e9"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value: AuthService().user,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
