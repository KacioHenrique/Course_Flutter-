import 'package:course_alura_flutter/data_Base/DataBaseManagerTransaction.dart';
import 'package:flutter/material.dart';
import '../../../components/bytebank_textfield.dart';
import '../../../models/transaction.dart';

class TransactionForm extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final database = DataBaseManagerTransaction();
  
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
          Padding(
            padding: EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () => _popTransaction(context),
              child: const Text("ADD"),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(double.infinity, 50),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _popTransaction(BuildContext context) async {
    final name = _nameController.text;
    final amount = double.parse(_amountController.text);
    final transaction = TransactionModel(name, amount, UniqueKey().toString());
    await database.insertInTable(transaction);
    Navigator.pop(context);
  }
}
