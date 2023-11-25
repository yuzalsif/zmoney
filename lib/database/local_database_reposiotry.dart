import 'package:zmoney/database/local_database.dart';
import 'package:zmoney/models/bank_account.dart';

class LocalDatabaseRepository {
  late AppDatabase localDatabse;
  late BankCardDao _bankCardDao;
  Stream<List<BankAccount>>? bankAccountStream;

  Future init() async {
    localDatabse = AppDatabase();
    _bankCardDao = localDatabse.bankCardDao;
  }

  void close() {
    localDatabse.close();
  }

  Stream<List<BankAccount>> watchAllInstances() {
    if (bankAccountStream == null) {
      final stream = _bankCardDao.getAllBankCards();

      bankAccountStream = stream.map((driftCards) {
        final instances = <BankAccount>[];
        for (var driftCard in driftCards) {
          instances.add(driftBankCardToBankAccount(driftCard));
        }
        return instances;
      });
    }
    return bankAccountStream!;
  }

  void addBankCard(BankAccount account) {
    final driftCard = bankAccountTodriftBankCard(account);
    _bankCardDao.insertBankCard(driftCard);
  }

  Future<bool> withdrawFromCard(int cardId, double amount) {
    return _bankCardDao.withdrawFromCard(cardId, amount);
  }

  Future<int> deleteCard(int cardId) {
    return _bankCardDao.deleteCard(cardId);
  }
}
