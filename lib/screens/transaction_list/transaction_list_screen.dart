import 'dart:async';

import 'package:course_alura_flutter/components/bank_app_list_item.dart';
import 'package:course_alura_flutter/screens/transaction_form/transaction_form.dart';
import 'package:flutter/material.dart';
import '../../Service/Api.dart';
import '../../components/bankAppFetchList.dart';
import '../../models/transactionModel.dart';

class TransactionListScreen extends StatelessWidget {
  const TransactionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BankFetchList(
        BankAppListItemTransactionFeed(),
        Api().findALL(),
      ),
    );
  }
}
