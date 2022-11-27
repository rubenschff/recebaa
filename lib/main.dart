import 'package:flutter/material.dart';
import 'package:recebaa/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recebaa/pages/login_page.dart';
import 'package:recebaa/pages/register_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const RegisterPage(),
    );
  }
}
