import 'package:course_alura_flutter/data_Base/DataBaseManagerTransaction.dart';
import 'package:flutter/material.dart';
import '../../models/transactionModel.dart';
import '../../components/bankAppFetchList.dart';
import '../../components/bank_app_list_item.dart';
import '../contact_form/contact_form_screen.dart';
import '../transaction_form/transaction_form.dart';

class ContactListScreen extends StatefulWidget {
  final String textString;

  const ContactListScreen({Key? key, required this.textString})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ContactListScreen();
  }
}

class _ContactListScreen extends State<ContactListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.textString),
      ),
      body: BankFetchList(
        BankAppListItemContact(
          (Contact contact) {
            pushFormScreenTransaction(context, contact);
          },
        ),
        DataBaseManagerAccount().fetchTransactionModel(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _pushFormContact(context),
      ),
    );
  }

  void _pushFormContact(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContactFormScreen(),
        ));
    _addToTheList();
  }

  void _addToTheList() {
    setState(() {
      debugPrint("here _addToTheList");
    });
  }
}

void pushFormScreenTransaction(BuildContext context, Contact contact) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TransactionForm(contact),
    ),
  );
}
