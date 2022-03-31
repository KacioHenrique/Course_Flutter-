import 'package:course_alura_flutter/components/ds_icon.dart';
import 'package:flutter/material.dart';
import 'package:course_alura_flutter/models/transactionModel.dart';

class BankAppListItemContact<Contact> implements Layout {
  @override
  Widget makeLayout(model) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.contact_phone),
        title: Text(model.name),
        subtitle: Text("${model.accountNumber}"),
      ),
    );
  }

  @override
  void tap(model) {}
}


class BankAppListItemTransactionFeed<TransactionFeed> implements Layout {
  final Function(TransactionFeed) onClick;

  BankAppListItemTransactionFeed({required this.onClick});

  @override
  Widget makeLayout(model) {
    return InkWell(
      child: Card(
        child: ListTile(
          leading: Default_icons.getIcon(Ds_icons.dolar),
          title: Text(model.contact.name),
          subtitle: Text("R\$  ${model.value}"),
        ),
      ),
      onTap: () {
        tap(model);
      },
    );
  }

  @override
  void tap(model) {
    onClick(model);
  }
}



abstract class Layout<T> {
  Widget makeLayout(T model);
  void tap(T model) {}
}
