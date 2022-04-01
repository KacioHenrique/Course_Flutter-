import 'dart:async';
import 'dart:developer';
import 'dart:ffi';

import 'package:course_alura_flutter/Service/Api.dart';
import 'package:course_alura_flutter/components/BankAlertDialogAuth.dart';
import 'package:flutter/material.dart';

import '../../models/transactionModel.dart';

class TransactionForm extends StatefulWidget {
  final Contact contact;

  TransactionForm(this.contact);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _valueController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New transaction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.contact.name,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
              makeFormComponents(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget makeFormComponents(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.contact.accountNumber.toString(),
          style: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _valueController,
          style: const TextStyle(fontSize: 24.0),
          decoration: const InputDecoration(labelText: 'Value'),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
            child: const Text('Transfer'),
            onPressed: () async {
              _showDialogAuth(context);
            },
          ),
        ),
      ],
    );
  }
  
  Future<void> _sendTransaction(String password) async {
    final value = double.parse(_valueController.text);
    TransactionFeed transaction = TransactionFeed("${Timeline.now}", value, widget.contact);
    await Api().save(transaction, password);
  }
  
  void _showDialogAuth(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BankAlertDialogAuth(
          'Password ',
          onConfirm: (String password) async {
            await _sendTransaction(password);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
