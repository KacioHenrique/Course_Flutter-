import 'dart:async';
import 'package:course_alura_flutter/data_Base/DataBaseManagerTransaction.dart';
import 'package:course_alura_flutter/screens/transaction_form/transaction_form_screen.dart';
import 'package:flutter/material.dart';
import '../../models/transaction.dart';
import 'components/transaction_list.dart';

class TransactionListScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TransactionListScreen();
  }
}

class _TransactionListScreen extends State<TransactionListScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transactions"),
      ),
      body: TransactionList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _pushListScreen(context),
      ),
    );
  }

  void _pushListScreen(BuildContext context) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionFormScreen(),));
    _addToTheList();
  }

  void _addToTheList() {
    setState(() {
      debugPrint("here _addToTheList");
    });
  }
}
