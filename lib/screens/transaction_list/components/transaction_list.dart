import 'package:course_alura_flutter/data_Base/DataBaseManagerTransaction.dart';
import 'package:course_alura_flutter/screens/transaction_list/components/transaction_list_item.dart';
import 'package:flutter/material.dart';
import '../../../models/transaction.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataBaseManagerTransaction().fetchTransactionModel(),
      builder: (context, AsyncSnapshot<List<TransactionModel>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none: break;
          case ConnectionState.waiting:
            return loadScreen();
          case ConnectionState.active:
            return loadScreen();
          case ConnectionState.done:
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return TransactionListItem(snapshot.data![index]);
              },
            );
        }
        return const Text("Error in connection");
      },
    );
  }

  Widget loadScreen() {
    return Center(
      child: Container(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
