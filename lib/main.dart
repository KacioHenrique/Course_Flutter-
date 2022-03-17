import 'package:course_alura_flutter/screens/dashboard/dash_board_screen.dart';
import 'package:course_alura_flutter/screens/transaction_form/components/transaction_form.dart';
import 'package:course_alura_flutter/screens/transaction_form/transaction_form_screen.dart';
import 'package:course_alura_flutter/screens/transaction_list/transaction_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
    );
  }
}
