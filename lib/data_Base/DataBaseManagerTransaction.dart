import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/transactionModel.dart';

class DataBaseManagerAccount {
  DataBaseManagerAccount() {
     createTable();
  }

  Future<Database> open() async {
    WidgetsFlutterBinding.ensureInitialized();
    final String path = await getDatabasesPath();
    debugPrint("PathDB: $path");
    final dataBase = openDatabase(
      join(path, 'contacts_database.db'),
      version: 1
    );
    return dataBase;
  }

  Future<void> deleteDatabase() async {
    final db = await open();
    db.delete('contacts');
  }

  Future<void> _populateDB(Database database, int version) async {
    await database.execute(
        'CREATE TABLE contacts(accountNumber INTEGER, name TEXT)');
    await database.setVersion(version);
  }

  Future<void> createTable() async {
    final dataBase = await open();
    _populateDB(dataBase, 1);
  }

  Future<int> insertInTable(Contact transaction) async {
    final Database database = await open();
    int result =
        await database.insert('contacts', transaction.toMap());
    return result;
  }

  Future<List<Contact>> fetchTransactionModel() async {
    final Database database = await open();
    final List<Map<String, dynamic>> map =
        await database.query('contacts');
    return List.generate(map.length, (index) {
      return Contact(
          map[index]['name'], map[index]['accountNumber'],);
    });
  }
}
