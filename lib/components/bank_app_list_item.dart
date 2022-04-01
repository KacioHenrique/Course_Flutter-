import 'package:course_alura_flutter/components/ds_icon.dart';
import 'package:flutter/material.dart';
import 'package:course_alura_flutter/models/transactionModel.dart';

class BankAppListItemContact<Contact> implements Layout {
  final Function(Contact) onClick;

  BankAppListItemContact(this.onClick);

  @override
  Widget makeLayout(model) {
    return Card(
      child: InkWell(
        child: ListTile(
          leading: const Icon(Icons.contact_phone),
          title: Text(model.name),
          subtitle: Text("${model.accountNumber}"),
        ),
        onTap: () {
          tap(model);
        },
      ),
    );
  }

  @override
  void tap(model) {
    onClick(model);
  }
}


class BankAppListItemTransactionFeed<TransactionFeed> implements Layout {
  @override
  Widget makeLayout(model) {
    return Card(
        child: ListTile(
          leading: Default_icons.getIcon(Ds_icons.dolar),
          title: Text(model.contact.name),
          subtitle: Text("R\$  ${model.value}"),
        ),
      );
  }

  @override
  void tap(model) {}

}



abstract class Layout<T> {
  Widget makeLayout(T model);
  void tap(T model) {}
}
