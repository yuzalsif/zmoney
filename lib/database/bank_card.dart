import 'package:drift/drift.dart';

class BankCard extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get cardNumber => text()();
  RealColumn get balance => real()();
  TextColumn get cardHolder => text()();
  TextColumn get bankName => text()();
}