import 'package:flutter/material.dart';

import '../models/bank_account.dart';


class BankCardModel with ChangeNotifier {
  final BankCard _bankCard;

  BankCardModel(this._bankCard);

  BankCard get bankCard => _bankCard;

  // Method to withdraw money
  void withdrawMoney(double amount) {
    double currentBalance = double.parse(_bankCard.balance);

    if (amount > 0 && amount <= currentBalance) {
      currentBalance -= amount;
      _bankCard.balance = currentBalance.toString();
      notifyListeners();
    } else {
      print('Invalid withdrawal amount or insufficient balance');
    }
  }

  // Add other methods as needed
}