import 'package:drift/drift.dart';

class DriftUserInAppMoneyAccount extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get balance => real()();
}