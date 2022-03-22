import 'package:course_alura_flutter/data_Base/DataBaseManagerTransaction.dart';
import 'package:flutter/material.dart';
import '../../components/ds_icon.dart';
import '../transaction_list/transaction_list_screen.dart';
import 'components/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            child: Image.asset("images/dashBoard.png"),
            padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
          ),
          Padding(
            child: DashboardCard("dolar", Ds_icons.dolar, () => navigateTo(context)),
            padding: const EdgeInsets.all(8),
          )
        ],
      ),
    );
  }

  void navigateTo(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TransactionListScreen(),
      ),
    );
  }
}
