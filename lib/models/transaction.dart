class Transaction {
  final String type; // 'Withdraw' or 'Deposit'
  final DateTime timestamp;
  final double amount;

  Transaction({
    required this.type,
    required this.timestamp,
    required this.amount,
  });
}
