import 'dart:async';
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
  final List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    debugPrint("building the state");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transactions"),
      ),
      body: TransactionList(transactions),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _pushListScreen(context),
      ),
    );
  }

  void _pushListScreen(BuildContext context) {
    final Future result = Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionFormScreen(),));
    result.then((value) => _addToTheList(value));
  }

  void _addToTheList(Transaction value) {
    debugPrint(value.toString());
    setState(() {
      transactions.add(value);
    });
  }

}
