import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zmoney/providers/bank_cards.dart';
import 'package:zmoney/screens/main.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BankCards(), 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'zmoney',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SafeArea(
          child: InitialScreen(),
        ),
        routes: {
          
        },
      ),
    );
  }
}
