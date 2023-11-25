// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// ignore_for_file: type=lint
class $BankCardTable extends BankCard
    with TableInfo<$BankCardTable, BankCardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BankCardTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _cardNumberMeta =
      const VerificationMeta('cardNumber');
  @override
  late final GeneratedColumn<String> cardNumber = GeneratedColumn<String>(
      'card_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _balanceMeta =
      const VerificationMeta('balance');
  @override
  late final GeneratedColumn<double> balance = GeneratedColumn<double>(
      'balance', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _cardHolderMeta =
      const VerificationMeta('cardHolder');
  @override
  late final GeneratedColumn<String> cardHolder = GeneratedColumn<String>(
      'card_holder', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bankNameMeta =
      const VerificationMeta('bankName');
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
      'bank_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, cardNumber, balance, cardHolder, bankName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bank_card';
  @override
  VerificationContext validateIntegrity(Insertable<BankCardData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('card_number')) {
      context.handle(
          _cardNumberMeta,
          cardNumber.isAcceptableOrUnknown(
              data['card_number']!, _cardNumberMeta));
    } else if (isInserting) {
      context.missing(_cardNumberMeta);
    }
    if (data.containsKey('balance')) {
      context.handle(_balanceMeta,
          balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta));
    } else if (isInserting) {
      context.missing(_balanceMeta);
    }
    if (data.containsKey('card_holder')) {
      context.handle(
          _cardHolderMeta,
          cardHolder.isAcceptableOrUnknown(
              data['card_holder']!, _cardHolderMeta));
    } else if (isInserting) {
      context.missing(_cardHolderMeta);
    }
    if (data.containsKey('bank_name')) {
      context.handle(_bankNameMeta,
          bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta));
    } else if (isInserting) {
      context.missing(_bankNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BankCardData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BankCardData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      cardNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card_number'])!,
      balance: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}balance'])!,
      cardHolder: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card_holder'])!,
      bankName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bank_name'])!,
    );
  }

  @override
  $BankCardTable createAlias(String alias) {
    return $BankCardTable(attachedDatabase, alias);
  }
}

class BankCardData extends DataClass implements Insertable<BankCardData> {
  final int id;
  final String cardNumber;
  final double balance;
  final String cardHolder;
  final String bankName;
  const BankCardData(
      {required this.id,
      required this.cardNumber,
      required this.balance,
      required this.cardHolder,
      required this.bankName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['card_number'] = Variable<String>(cardNumber);
    map['balance'] = Variable<double>(balance);
    map['card_holder'] = Variable<String>(cardHolder);
    map['bank_name'] = Variable<String>(bankName);
    return map;
  }

  BankCardCompanion toCompanion(bool nullToAbsent) {
    return BankCardCompanion(
      id: Value(id),
      cardNumber: Value(cardNumber),
      balance: Value(balance),
      cardHolder: Value(cardHolder),
      bankName: Value(bankName),
    );
  }

  factory BankCardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankCardData(
      id: serializer.fromJson<int>(json['id']),
      cardNumber: serializer.fromJson<String>(json['cardNumber']),
      balance: serializer.fromJson<double>(json['balance']),
      cardHolder: serializer.fromJson<String>(json['cardHolder']),
      bankName: serializer.fromJson<String>(json['bankName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cardNumber': serializer.toJson<String>(cardNumber),
      'balance': serializer.toJson<double>(balance),
      'cardHolder': serializer.toJson<String>(cardHolder),
      'bankName': serializer.toJson<String>(bankName),
    };
  }

  BankCardData copyWith(
          {int? id,
          String? cardNumber,
          double? balance,
          String? cardHolder,
          String? bankName}) =>
      BankCardData(
        id: id ?? this.id,
        cardNumber: cardNumber ?? this.cardNumber,
        balance: balance ?? this.balance,
        cardHolder: cardHolder ?? this.cardHolder,
        bankName: bankName ?? this.bankName,
      );
  @override
  String toString() {
    return (StringBuffer('BankCardData(')
          ..write('id: $id, ')
          ..write('cardNumber: $cardNumber, ')
          ..write('balance: $balance, ')
          ..write('cardHolder: $cardHolder, ')
          ..write('bankName: $bankName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, cardNumber, balance, cardHolder, bankName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankCardData &&
          other.id == this.id &&
          other.cardNumber == this.cardNumber &&
          other.balance == this.balance &&
          other.cardHolder == this.cardHolder &&
          other.bankName == this.bankName);
}

class BankCardCompanion extends UpdateCompanion<BankCardData> {
  final Value<int> id;
  final Value<String> cardNumber;
  final Value<double> balance;
  final Value<String> cardHolder;
  final Value<String> bankName;
  const BankCardCompanion({
    this.id = const Value.absent(),
    this.cardNumber = const Value.absent(),
    this.balance = const Value.absent(),
    this.cardHolder = const Value.absent(),
    this.bankName = const Value.absent(),
  });
  BankCardCompanion.insert({
    this.id = const Value.absent(),
    required String cardNumber,
    required double balance,
    required String cardHolder,
    required String bankName,
  })  : cardNumber = Value(cardNumber),
        balance = Value(balance),
        cardHolder = Value(cardHolder),
        bankName = Value(bankName);
  static Insertable<BankCardData> custom({
    Expression<int>? id,
    Expression<String>? cardNumber,
    Expression<double>? balance,
    Expression<String>? cardHolder,
    Expression<String>? bankName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cardNumber != null) 'card_number': cardNumber,
      if (balance != null) 'balance': balance,
      if (cardHolder != null) 'card_holder': cardHolder,
      if (bankName != null) 'bank_name': bankName,
    });
  }

  BankCardCompanion copyWith(
      {Value<int>? id,
      Value<String>? cardNumber,
      Value<double>? balance,
      Value<String>? cardHolder,
      Value<String>? bankName}) {
    return BankCardCompanion(
      id: id ?? this.id,
      cardNumber: cardNumber ?? this.cardNumber,
      balance: balance ?? this.balance,
      cardHolder: cardHolder ?? this.cardHolder,
      bankName: bankName ?? this.bankName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cardNumber.present) {
      map['card_number'] = Variable<String>(cardNumber.value);
    }
    if (balance.present) {
      map['balance'] = Variable<double>(balance.value);
    }
    if (cardHolder.present) {
      map['card_holder'] = Variable<String>(cardHolder.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankCardCompanion(')
          ..write('id: $id, ')
          ..write('cardNumber: $cardNumber, ')
          ..write('balance: $balance, ')
          ..write('cardHolder: $cardHolder, ')
          ..write('bankName: $bankName')
          ..write(')'))
        .toString();
  }
}

class $DriftUserInAppMoneyAccountTable extends DriftUserInAppMoneyAccount
    with
        TableInfo<$DriftUserInAppMoneyAccountTable,
            DriftUserInAppMoneyAccountData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftUserInAppMoneyAccountTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _balanceMeta =
      const VerificationMeta('balance');
  @override
  late final GeneratedColumn<double> balance = GeneratedColumn<double>(
      'balance', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, balance];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_user_in_app_money_account';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftUserInAppMoneyAccountData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('balance')) {
      context.handle(_balanceMeta,
          balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta));
    } else if (isInserting) {
      context.missing(_balanceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftUserInAppMoneyAccountData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftUserInAppMoneyAccountData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      balance: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}balance'])!,
    );
  }

  @override
  $DriftUserInAppMoneyAccountTable createAlias(String alias) {
    return $DriftUserInAppMoneyAccountTable(attachedDatabase, alias);
  }
}

class DriftUserInAppMoneyAccountData extends DataClass
    implements Insertable<DriftUserInAppMoneyAccountData> {
  final int id;
  final double balance;
  const DriftUserInAppMoneyAccountData(
      {required this.id, required this.balance});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['balance'] = Variable<double>(balance);
    return map;
  }

  DriftUserInAppMoneyAccountCompanion toCompanion(bool nullToAbsent) {
    return DriftUserInAppMoneyAccountCompanion(
      id: Value(id),
      balance: Value(balance),
    );
  }

  factory DriftUserInAppMoneyAccountData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftUserInAppMoneyAccountData(
      id: serializer.fromJson<int>(json['id']),
      balance: serializer.fromJson<double>(json['balance']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'balance': serializer.toJson<double>(balance),
    };
  }

  DriftUserInAppMoneyAccountData copyWith({int? id, double? balance}) =>
      DriftUserInAppMoneyAccountData(
        id: id ?? this.id,
        balance: balance ?? this.balance,
      );
  @override
  String toString() {
    return (StringBuffer('DriftUserInAppMoneyAccountData(')
          ..write('id: $id, ')
          ..write('balance: $balance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, balance);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftUserInAppMoneyAccountData &&
          other.id == this.id &&
          other.balance == this.balance);
}

class DriftUserInAppMoneyAccountCompanion
    extends UpdateCompanion<DriftUserInAppMoneyAccountData> {
  final Value<int> id;
  final Value<double> balance;
  const DriftUserInAppMoneyAccountCompanion({
    this.id = const Value.absent(),
    this.balance = const Value.absent(),
  });
  DriftUserInAppMoneyAccountCompanion.insert({
    this.id = const Value.absent(),
    required double balance,
  }) : balance = Value(balance);
  static Insertable<DriftUserInAppMoneyAccountData> custom({
    Expression<int>? id,
    Expression<double>? balance,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (balance != null) 'balance': balance,
    });
  }

  DriftUserInAppMoneyAccountCompanion copyWith(
      {Value<int>? id, Value<double>? balance}) {
    return DriftUserInAppMoneyAccountCompanion(
      id: id ?? this.id,
      balance: balance ?? this.balance,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (balance.present) {
      map['balance'] = Variable<double>(balance.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftUserInAppMoneyAccountCompanion(')
          ..write('id: $id, ')
          ..write('balance: $balance')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $BankCardTable bankCard = $BankCardTable(this);
  late final $DriftUserInAppMoneyAccountTable driftUserInAppMoneyAccount =
      $DriftUserInAppMoneyAccountTable(this);
  late final BankCardDao bankCardDao = BankCardDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [bankCard, driftUserInAppMoneyAccount];
}

mixin _$BankCardDaoMixin on DatabaseAccessor<AppDatabase> {
  $BankCardTable get bankCard => attachedDatabase.bankCard;
}
