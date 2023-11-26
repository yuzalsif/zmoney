import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zmoney/providers/goal.dart'; // Import your GoalProvider
import 'package:zmoney/screens/history.dart';

import 'package:zmoney/screens/home.dart';
import 'package:zmoney/screens/saving.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoalProvider(), // Initialize your GoalProvider
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'zmoney',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SafeArea(
          child: HomeScreen(),
        ),
        routes: {
          
        },
      ),
    );
  }
}
