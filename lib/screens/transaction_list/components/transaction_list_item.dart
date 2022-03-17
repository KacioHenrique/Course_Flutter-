
import 'package:flutter/material.dart';

import '../../../models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction _transaction;

  const TransactionListItem(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.attach_money),
        title: Text(_transaction.name),
        subtitle: Text(_transaction.amount.toString()),
      ),
    );
  }
}
