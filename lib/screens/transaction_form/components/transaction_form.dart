import 'package:course_alura_flutter/data_Base/DataBaseManagerTransaction.dart';
import 'package:flutter/material.dart';
import '../../../components/bytebank_textfield.dart';
import '../../../models/transactionModel.dart';

class TransactionForm extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final database = DataBaseManagerAccount();

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
            _accountNumberController,
            "Number",
            "995550252",
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
    final accountNumber = int.parse(_accountNumberController.text);
    final transaction = Contact(name, accountNumber);
    await database.insertInTable(transaction);
    Navigator.pop(context);
  }
}
