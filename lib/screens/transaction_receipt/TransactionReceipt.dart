import 'dart:async';

import 'package:course_alura_flutter/components/bank_app_list_item.dart';
import 'package:flutter/material.dart';

import '../../components/bankAppFetchList.dart';
import '../../models/transactionModel.dart';

class TransactionReceipt extends StatelessWidget {
  const TransactionReceipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BankFetchList(BankAppListItem(), loadInfo()));
  }

  Future<List<TransactionFeed>> loadInfo() async {
    await Future.delayed(const Duration(seconds: 2));
    return [];
  }
}
