import 'package:flutter/material.dart';
import 'package:zmoney/models/bank_account.dart';

class BankCards with ChangeNotifier {
  final List<BankCard> _cards = [
    BankCard(
      bankLogo: Icons.account_balance,
      bankName: 'NBC BANK',
      accountHolder: 'John Doe',
      accountNumber: '**** **** **** 3456',
      balance: '231234.56',
      cardColor: const LinearGradient(
        begin: Alignment(0.71, -0.71),
        end: Alignment(-0.71, 0.71),
        colors: [Color(0xFF94EDF7), Color(0xFF94C3F6)],
      ),
    ),
    
    BankCard(
      bankLogo: Icons.account_balance,
      bankName: 'CRDB BANK',
      accountHolder: 'John Doe',
      accountNumber: '**** **** **** 7654',
      balance: '72345.67',
      cardColor: LinearGradient(
        begin: const Alignment(0.71, -0.71),
        end: const Alignment(-0.71, 0.71),
        colors: [
          const Color(0x9950C4747).withOpacity(0.7),
          const Color(0xFF298408)
        ],
      ),
    ),
  ];

  List<BankCard> get cards => [..._cards];

  void addCard(BankCard card) {
    _cards.add(card);
    notifyListeners();
  }

  void withdrawMoney(BankCard card, double amount) {
    // Assuming balance is stored as a string, you may need to parse it
    double currentBalance = double.parse(card.balance);

    if (currentBalance >= amount) {
      currentBalance -= amount;
      card.balance = currentBalance.toStringAsFixed(2);
      notifyListeners();
    } else {
      // Handle insufficient funds
      print('Insufficient funds');
    }
  }

void depositMoney(BankCard card, double amount) {
    // Assuming balance is stored as a string, you may need to parse it
    double currentBalance = double.parse(card.balance);

    if (currentBalance >= amount) {
      currentBalance -= amount;
      card.balance = currentBalance.toStringAsFixed(2);
      notifyListeners();
    } else {
      // Handle insufficient funds
      print('Insufficient funds');
    }
  }

}