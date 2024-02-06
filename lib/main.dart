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
<<<<<<< HEAD
          child: InitialScreen(),
=======
          child: HomeScreen(),
>>>>>>> 7547a37166274f91c387a33ced5a44acacacee51
        ),
        routes: {
          
        },
      ),
    );
  }
}
