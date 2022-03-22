import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/transaction.dart';

class DataBaseManagerTransaction {

  DataBaseManagerTransaction() {
    createTable();
  }

  Future<Database> open() async {
    WidgetsFlutterBinding.ensureInitialized();
    final dataBase = openDatabase(
      join(await getDatabasesPath(), 'transaction_database.db'),
    );
    return dataBase;
  }

  void _populateDB(Database database, int version) async {
     await database.execute('CREATE TABLE transaction_model(id TEXT PRIMARY KEY, name TEXT, amount REAL)');
     await database.setVersion(version);
  }

  void createTable() async {
    final dataBase = await open();
    _populateDB(dataBase, 1);
  }

  Future<int> insertInTable(TransactionModel transaction) async {
    final Database database = await open();
    int result = await database.insert('transaction_model', transaction.toMap());
    return result;
  }

  Future<List<TransactionModel>> fetchTransactionModel() async {
    final Database database = await open();
    final List<Map<String, dynamic>> map = await database.query('transaction_model');
    return List.generate(map.length, (index) {
      return TransactionModel(map[index]['name'], map[index]['amount'], map[index]['id']);
    });
  }

}
