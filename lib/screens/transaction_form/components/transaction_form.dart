import 'package:flutter/material.dart';

import '../../../components/bytebank_textfield.dart';
import '../../../models/transaction.dart';

class TransactionForm extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ByteBankTextField(
            _nameController,
            "Name",
            "John Doe",
            TextInputType.name,
          ),
          ByteBankTextField(
            _amountController,
            "Amount",
            "0.00",
            TextInputType.number,
            icon: const Icon(Icons.monetization_on),
          ),
          ElevatedButton(
            onPressed: () => _popTransaction(context),
            child: const Text("ADD"),
          )
        ],
      ),
    );
  }

  _popTransaction(BuildContext context) {
    final name = _nameController.text;
    final amount = double.parse(_amountController.text);
    final transaction = Transaction(name, amount);
    Navigator.pop(context, transaction);
  }
}
