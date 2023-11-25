class Record {
  String recordId;
  String userId;
  double amount;
  String purpose;
  DateTime timestamp;

  Record({
    required this.recordId,
    required this.userId,
    required this.amount,
    required this.purpose,
    required this.timestamp,
  });
}
