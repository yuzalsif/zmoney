import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 233, 233),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 235, 233, 233),
        elevation: 0,
        title: Text(
          'z money',
          style: GoogleFonts.caveatBrush(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 32,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Divider(
                      thickness: 7.0,
                      height: 3.0,
                      color: Colors.transparent,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: [
                        Text(
                          'Total Balance',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '***********',
                          style: TextStyle(
                            fontSize: 32.0,
                            letterSpacing: 4,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Show'),
                            Icon(Icons.remove_red_eye),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Divider(
                      thickness: 7.0,
                      height: 3.0,
                      color: Colors.transparent,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Cards',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(width: 2.0),
                      Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 4),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BankAccountCard(
                          bankLogo: Icons.account_balance,
                          bankName: 'NBC BANK',
                          accountHolder: 'John Doe',
                          accountNumber: '**** **** **** 3456',
                          balance: '\Tshs 231,234.56',
                          cardColor: LinearGradient(
                            begin: Alignment(0.71, -0.71),
                            end: Alignment(-0.71, 0.71),
                            colors: [Color(0xFF94EDF7), Color(0xFF94C3F6)],
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        BankAccountCard(
                          bankLogo: Icons.account_balance,
                          bankName: 'CRDB BANK',
                          accountHolder: 'Jane Smith',
                          accountNumber: '**** **** **** 7654',
                          balance: '\Tshs 72,345.67',
                          cardColor: LinearGradient(
                            begin: Alignment(0.71, -0.71),
                            end: Alignment(-0.71, 0.71),
                            colors: [
                              Color(0x9950C4747).withOpacity(0.7),
                              Color(0xFF298408)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              width: double.infinity,
              height: 90,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Color(0xFF27AE60),
                              shape: CircleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Deposit',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Color(0xFF3498DB),
                              shape: CircleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Send',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF39C12),
                              shape: CircleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.request_page,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Request',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Color(0xFFE74C3C),
                              shape: CircleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Withdraw',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            // Row(
            //   //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Text(
            //       'History',
            //       style: TextStyle(fontSize: 16, ),
            //     ),
            //     Text(
            //       'View All',
            //       style: TextStyle(fontSize: 16, color: Colors.blue),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class BankAccountCard extends StatelessWidget {
  final IconData bankLogo;
  final String bankName;
  final String accountHolder;
  final String accountNumber;
  final String balance;
  final LinearGradient cardColor;
  final BorderRadiusGeometry? borderRadius;

  BankAccountCard({
    required this.bankLogo,
    required this.bankName,
    required this.accountHolder,
    required this.accountNumber,
    required this.balance,
    required this.cardColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 273,
      height: 169,
      decoration: ShapeDecoration(
        gradient: cardColor,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0)),
        shadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.only(right: 16.0),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                bankName,
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                bankLogo,
                size: 25.0,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 34.0),
          // Text(
          //   'Account Holder: $accountHolder',
          //   style: TextStyle(color: Colors.white),
          // ),
          // SizedBox(height: 8.0),
          Center(
            child: FittedBox(
              child: Text(
                accountNumber,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Balance: $balance',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
