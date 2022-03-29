import 'package:course_alura_flutter/components/ds_icon.dart';
import 'package:flutter/material.dart';

class BankAppListItem<Contact> implements Layout {
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
}

abstract class Layout<T> {
  Widget makeLayout(T model);
}
