import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 235, 233, 233), // Set the background color here
      appBar: AppBar(
        backgroundColor:
            Color.fromARGB(255, 235, 233, 233), // Set a transparent background
        elevation: 0, // Remove the elevation shadow
        title: Text(
          'z money', // Your app title
          style: GoogleFonts.caveatBrush(
            textStyle: TextStyle(
              color: Colors.black, // Text color
              fontSize: 32, // Adjust the size as needed
            ),
          ),
        ),
        centerTitle: true, // Center the title horizontally
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // First Divider
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300], // Adjust the color as needed
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
      
                  // Text, Asterisks, Show Text, and Eye Icon
                  Container(
                    padding: EdgeInsets.only(top: 12.0),
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
                        //  SizedBox(height: 1.0),
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
      
                  // Second Divider
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300], // Adjust the color as needed
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
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Cards',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(width: 2.0), // Adjust spacing as needed
                      Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(
                              0.2), // Set the color of the circular container
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 20.0,
                            color: Colors.black, // Set the color of the add icon
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                    child:  Row(
                      children: [
                        BankAccountCard(
                          bankLogo: Icons.account_balance,
                          bankName: 'Bank of Flutter',
                          accountHolder: 'John Doe',
                          accountNumber: '1234 5678 9012 3456',
                          balance: '\$1,234.56',
                          cardColor: Color(0xFF3498db).withOpacity(0.9),
                         
                        ),
                        BankAccountCard(
                          bankLogo: Icons.account_balance,
                          bankName: 'Dart Bank',
                          accountHolder: 'Jane Smith',
                          accountNumber: '9876 5432 1098 7654',
                          balance: '\$2,345.67',
                          cardColor: Color(0xFF2ecc71).withOpacity(0.9),
                         
                        ),
                        // Add more BankAccountCard widgets as needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
  final Color cardColor;
 

  BankAccountCard({
    required this.bankLogo,
    required this.bankName,
    required this.accountHolder,
    required this.accountNumber,
    required this.balance,
    required this.cardColor,
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 150,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 0.7],
          colors: [
            cardColor.withOpacity(0.9),
            cardColor.withOpacity(0.6),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                bankLogo,
                size: 30.0,
                color: Colors.white,
              ),
              Text(
                bankName,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            'Account Holder: $accountHolder',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8.0),
          Text(
            'Account Number: $accountNumber',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8.0),
          Text(
            'Balance: $balance',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
