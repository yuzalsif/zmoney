import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zmoney/screens/analytics.dart';
import 'package:zmoney/screens/dashboard.dart';
import 'package:zmoney/screens/history.dart';
import 'package:zmoney/screens/saving.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final pages = [
    const Dashboard(),
    const HistoryScreen(),
    const SavingScreen(),
    AnalyticsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 233, 233),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 235, 233, 233),
        elevation: 0,
        title: Text(
          'Z Money',
          style: GoogleFonts.caveatBrush(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 32,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFDADADA),
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Savings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Analytics',
          ),
        ],
      ),
    );
  }
}
