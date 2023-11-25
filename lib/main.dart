import 'package:flutter/material.dart';
import 'package:zmoney/constants/repository.dart';
import 'package:zmoney/database/local_database_reposiotry.dart';
import 'package:zmoney/screens/home.dart';



void main() async {
  repository = LocalDatabaseRepository();
  await repository.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'zmoney',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(
        child: HomeScreen(),
      ),
    );
  }
}
