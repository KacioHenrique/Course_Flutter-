import 'package:flutter/cupertino.dart';

class TransactionModel {
  final String name;
  final double amount;
  final String id;

  TransactionModel(this.name, this.amount, this.id);

  @override
  String toString() {
    return "Transaction[$name $amount]";
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'id': id,
      'name': name
    };
  }
}
