import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseprojebaglantisi/home_page.dart';
import 'package:firebaseprojebaglantisi/get.dart';
import 'package:firebaseprojebaglantisi/status_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase baglantısı',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Home(),
    );
  }
}
