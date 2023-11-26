import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.only(left: 12, ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text(
            'History Transaction',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              //fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 1,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: 368,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              tileColor: Colors.white,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'deposit',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '24 04 2012.08:00 pm',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF979797),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                'Tshs 124,000',
                style: TextStyle(
                  color: Color(0xFF27AE60),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 368,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              tileColor: Colors.white,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'withdrew money for food',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '24 04 2012.08:00 pm',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF979797),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                'Tshs -124,000',
                style: TextStyle(
                  color: Color(0xFFE74C3C),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 368,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              tileColor: Colors.white,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'money request',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '24 04 2012.08:00 pm',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF979797),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                'Tshs 124,000',
                style: TextStyle(
                  color: Color(0xFFF39C12),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ]),
      ),
    );
  }
}
