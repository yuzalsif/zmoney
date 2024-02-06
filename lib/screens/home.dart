import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
import 'package:zmoney/models/bank_account.dart';
import 'package:zmoney/providers/bank_cards.dart';

import 'package:intl/intl.dart';
import 'dart:math';
=======
import 'package:zmoney/screens/analytics.dart';
import 'package:zmoney/screens/dashboard.dart';
import 'package:zmoney/screens/history.dart';
import 'package:zmoney/screens/saving.dart';
>>>>>>> 7547a37166274f91c387a33ced5a44acacacee51

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  BankCard? selectedCard;
  double totalBalance = 0.0;
  bool isBalanceVisible = false;

  final pages = [
    const Dashboard(),
    const HistoryScreen(),
    const SavingScreen(),
    AnalyticsPage()
  ];

  @override
  Widget build(BuildContext context) {
    final bankCardProvider = Provider.of<BankCards>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 233, 233),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 233, 233),
        elevation: 0,
        title: Text(
          'Z Money',
          style: GoogleFonts.caveatBrush(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 32,
            ),
          ),
        ),
        centerTitle: true,
      ),
<<<<<<< HEAD
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTotalBalance(),
              _buildCardAddAndViewButton(),
              const SizedBox(
                height: 8,
              ),
              _buildCardSection(bankCardProvider),
              const SizedBox(
                height: 12,
              ),
              _buildTransactionButtons(context),
            //  _buildHistorySection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTotalBalance() {
    TextStyle visibleTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      letterSpacing: 3,
    );
    TextStyle hiddenTextStyle = const TextStyle(
      fontSize: 32.0,
      letterSpacing: 4,
    );

    return Column(
      children: [
        _buildDivider(),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
          child: Column(
            children: [
              const Text('Total Balance', style: TextStyle(fontSize: 18.0)),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 24,
                child: Text(
                  isBalanceVisible
                      ? _formatCurrency(totalBalance)
                      : '***********',
                  style: isBalanceVisible ? visibleTextStyle : hiddenTextStyle,
                ),
              ),
             const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Show'),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.remove_red_eye,
                    ),
                    onTap: () {
                      setState(() {
                        isBalanceVisible = !isBalanceVisible;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        _buildDivider(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 1.0, offset: Offset(0, 0))
        ],
      ),
      child:
          const Divider(thickness: 7.0, height: 3.0, color: Colors.transparent),
    );
  }

  Widget _buildCardAddAndViewButton() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1.0,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: const Divider(
            thickness: 7.0,
            height: 3.0,
            color: Colors.transparent,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Cards',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(width: 2.0),
            InkWell(
              child: Container(
                width: 25.0,
                height: 25.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
              onTap: () {
                _showAddCardDialog(context);
              },
            ),
            const SizedBox(
              width: 250,
            ),
            const Text(
              'View all',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCardSection(BankCards bankAccountProvider) {
    return Container(
      height: 169,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bankAccountProvider.cards.length,
        itemBuilder: (ctx, i) => Container(
          width: 273,
          height: 169,
          decoration: ShapeDecoration(
            gradient: bankAccountProvider.cards[i].cardColor,
            shape: RoundedRectangleBorder(
                borderRadius: bankAccountProvider.cards[i].borderRadius ??
                    BorderRadius.circular(8.0)),
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
                    bankAccountProvider.cards[i].bankName,
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    bankAccountProvider.cards[i].bankLogo,
                    size: 25.0,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 34.0),
              Center(
                child: FittedBox(
                  child: Text(
                    bankAccountProvider.cards[i].accountNumber,
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
                'Balance: ${bankAccountProvider.cards[i].balance}',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionButtons(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 77,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Expanded(
            // child:
            _buildTransactionButton(
              Icons.arrow_downward,
              'Deposit',
              const Color(0xFF27AE60),
              () {
                // TextEditingController withdrawAmountController =
                //     TextEditingController();

                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //         title: const Text('enter withdraw amout'),
                //         content: TextFormField(
                //           controller: withdrawAmountController,
                //           decoration: const InputDecoration(
                //               labelText: 'Enter withdraw amount'),
                //         ),
                //         actions: [
                //           TextButton(
                //             onPressed: () {},
                //             child: const Text('Withdraw'),
                //           ),
                //           TextButton(
                //             onPressed: () {
                //               Navigator.of(context).pop();
                //             },
                //             child: const Text('Cancel'),
                //           ),
                //         ]);
                //   },
                // );
                _handleDeposit(context);
              },
            ),
            //  ),
            // Expanded(
            // child:
            _buildTransactionButton(
              Icons.send,
              'Send',
              const Color(0xFF3498DB),
              () {},
            ),
            // ),
            //Expanded(
            //  child:
            _buildTransactionButton(
              Icons.request_page,
              'Request',
              const Color(0xFFF39C12),
              () {},
            ),
            // ),
            // Expanded(
            //  child:
            _buildTransactionButton(
              Icons.arrow_upward,
              'Withdraw',
              const Color(0xFFE74C3C),
              () {
                _handleWithdraw(context);
              },
            ),
            //  ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionButton(
    IconData icon,
    String label,
    Color color,
    VoidCallback onTap,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 50,
            height: 45,
            decoration: ShapeDecoration(
              color: color,
              shape: CircleBorder(
                side:
                    BorderSide(width: 1, color: Colors.black.withOpacity(0.4)),
              ),
            ),
            child: Icon(icon, color: Colors.white),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  void _handleWithdraw(BuildContext context) {
    TextEditingController withdrawAmountController = TextEditingController();
    BankCards bankCards = Provider.of<BankCards>(context, listen: false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Withdraw Money'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Select Card:'),
                  DropdownButton<BankCard>(
                    value: selectedCard,
                    onChanged: (BankCard? value) {
                      setState(() {
                        selectedCard = value;
                      });
                    },
                    items: bankCards.cards.map<DropdownMenuItem<BankCard>>(
                      (BankCard card) {
                        return DropdownMenuItem<BankCard>(
                          value: card,
                          child: Text(card.bankName),
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(height: 8.0),
                  const Text('Enter Withdrawal Amount:'),
                  TextFormField(
                    controller: withdrawAmountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    double withdrawalAmount =
                        double.tryParse(withdrawAmountController.text) ?? 0.0;

                    if (selectedCard != null) {
                      bankCards.withdrawMoney(selectedCard!, withdrawalAmount);
                    }

                    Navigator.of(context).pop();
                  },
                  child: const Text('Withdraw'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _handleDeposit(BuildContext context) {
    TextEditingController depositAmountController = TextEditingController();
    BankCards bankCards = Provider.of<BankCards>(context, listen: false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Withdraw Money'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Select Card:'),
                  DropdownButton<BankCard>(
                    value: selectedCard,
                    onChanged: (BankCard? value) {
                      setState(() {
                        selectedCard = value;
                      });
                    },
                    items: bankCards.cards.map<DropdownMenuItem<BankCard>>(
                      (BankCard card) {
                        return DropdownMenuItem<BankCard>(
                          value: card,
                          child: Text(card.bankName),
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(height: 8.0),
                  const Text('Enter Withdrawal Amount:'),
                  TextFormField(
                    controller: depositAmountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    double depositAmount =
                        double.tryParse(depositAmountController.text) ?? 0.0;

                    if (selectedCard != null) {
                      bankCards.depositMoney(selectedCard!, depositAmount);

                      // Update total balance
                      setState(() {
                        totalBalance += depositAmount;
                        isBalanceVisible = false; // Reset visibility
                      });
                    }

                    Navigator.of(context).pop();
                  },
                  child: const Text('deposit'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );
  }

String _formatCurrency(double amount) {
  final formatter = NumberFormat.currency(
    locale: 'sw_TZ', // Tanzanian locale
    symbol: 'Tzs',    // Tanzanian Shilling symbol
  );
  return formatter.format(amount);
}

  Widget _buildHistorySection() {
    return Column(
      children: [
        const SizedBox(height: 24),
        Row(
          children: const [
            SizedBox(width: 16),
            Text('History', style: TextStyle(fontSize: 16)),
            SizedBox(width: 253),
            Text('View All',
                style: TextStyle(fontSize: 16, color: Colors.blue)),
          ],
        ),
        const SizedBox(height: 8),
        _buildTransactionTile('Transfer to Yus', '24 04 2012.08:00 pm',
            'Tshs 24,000', const Color(0xFFFF0808)),
        const SizedBox(height: 8),
        _buildTransactionTile('Deposit', '24 04 2012.08:00 pm', 'Tshs 124,000',
            const Color(0xFF27AE60)),
      ],
    );
  }

  Widget _buildTransactionTile(
      String title, String date, String amount, Color amountColor) {
    return SizedBox(
      width: 368,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        tileColor: Colors.white,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            Text(date,
                style: const TextStyle(fontSize: 12, color: Color(0xFF979797))),
          ],
        ),
        trailing:
            Text(amount, style: TextStyle(color: amountColor, fontSize: 14)),
      ),
    );
  }
}

void _showAddCardDialog(BuildContext context) {
  //TextEditingController accountHolderController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  // TextEditingController balanceController = TextEditingController();

  // Map to associate each bank with its card color
  Map<String, Gradient> bankColorMap = {
    'RTC bank': const LinearGradient(
      begin: Alignment(0.71, -0.71),
      end: Alignment(-0.71, 0.71),
      colors: [
        Color(0xFF94EDF7),
        Color(0xFF94C3F6),
      ],
    ),
    'ZXD bank': const LinearGradient(
      begin: Alignment(0.71, -0.71),
      end: Alignment(-0.71, 0.71),
      colors: [
        Color(0xFF94F794),
        Color(0xFF94D3F6),
      ],
    ),
    'JHY bank': const LinearGradient(
      begin: Alignment(0.71, -0.71),
      end: Alignment(-0.71, 0.71),
      colors: [
        Color(0xFF94F794),
        Color(0xFF94C3F6),
      ],
    ),
    'AQW bank': const LinearGradient(
      begin: Alignment(0.71, -0.71),
      end: Alignment(-0.71, 0.71),
      colors: [
        Color(0xFF94EDF7),
        Color(0xFF94D3F6),
      ],
    ),
  };

  String selectedBank = 'RTC bank'; // Default selected bank

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add Bank Card'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: selectedBank,
                onChanged: (value) {
                  // Update the selected bank
                  selectedBank = value!;
                },
                items: ['RTC bank', 'ZXD bank', 'JHY bank', 'AQW bank']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Bank Name'),
              ),
              // TextFormField(
              //   controller: accountHolderController,
              //   decoration: InputDecoration(labelText: 'Account Holder'),
              // ),
              TextFormField(
                controller: accountNumberController,
                decoration: InputDecoration(labelText: 'Account Number'),
              ),
              // TextFormField(
              //   controller: balanceController,
              //   decoration: InputDecoration(labelText: 'Balance'),
              // ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Generate a random number between 100 and 999,999
              int randomBalance = Random().nextInt(999999 - 100 + 1) + 100;

              // Format the randomBalance with commas
              String formattedBalance =
                  NumberFormat('#,##0').format(randomBalance);
              // Add logic to save the bank card details and update the UI
              BankCard newCard = BankCard(
                bankLogo: Icons.account_balance,
                bankName: selectedBank,
                accountHolder: 'John Doe',
                //accountHolderController.text,
                accountNumber: accountNumberController.text,
                balance: formattedBalance,
                //'\Tshs ${balanceController.text}',
                cardColor: bankColorMap[selectedBank],
              );

              Provider.of<BankCards>(context, listen: false).addCard(newCard);

              Navigator.of(context).pop();
            },
            child: Text('Add'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
        ],
      );
    },
  );
=======
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
>>>>>>> 7547a37166274f91c387a33ced5a44acacacee51
}
