import 'package:flutter/material.dart';

import '../../models/transactionModel.dart';
import '../../components/bytebank_textfield.dart';
import 'components/contact_form.dart';

class ContactFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Contact"),
      ),
      body: ContactForm(),
    );
  }
}
