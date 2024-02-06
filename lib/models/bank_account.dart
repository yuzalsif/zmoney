import 'package:flutter/material.dart';

class BankCard  with ChangeNotifier {
  final IconData bankLogo;
  final String bankName;
  final String accountHolder;
  final String accountNumber;
  String balance;
  final Gradient? cardColor;
  final BorderRadiusGeometry? borderRadius;

  BankCard({
    required this.bankLogo,
    required this.bankName,
    required this.accountHolder,
    required this.accountNumber,
    required this.balance,
    required this.cardColor,
    this.borderRadius,
  });

}
