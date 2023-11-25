// These imports are necessary to open the sqlite3 database
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:zmoney/database/bank_card.dart';

part 'local_database.g.dart';

@DriftDatabase(
  tables: [BankCard],
  daos: [BankCardDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftAccessor(tables: [BankCard])
class BankCardDao extends DatabaseAccessor<AppDatabase>
    with _$BankCardDaoMixin {
  BankCardDao(AppDatabase db) : super(db);

  // Get all bank cards
  Stream<List<BankCardData>> getAllBankCards() {
    return select(bankCard).watch();
  }

  // Insert a new bank card
  Future<int> insertBankCard(BankCardCompanion card) {
    return into(bankCard).insert(card);
  }

  // Withdraw from a specific card
  Future<bool> withdrawFromCard(int cardId, double amount) async {
    // Get the card from the database
    final card = await (select(bankCard)..where((tbl) => tbl.id.equals(cardId)))
        .getSingle();

    // Subtract the amount from the card's balance
    final newBalance = card.balance - amount;

    // Create a new BankCard instance with the updated balance
    final updatedCard = card.copyWith(balance: newBalance);

    // Update the card in the database
    return update(bankCard).replace(updatedCard);
  }
}
