import 'package:course_alura_flutter/components/bank_app_list_item.dart';
import 'package:flutter/material.dart';

class BankFetchList<T> extends StatelessWidget {
  final Layout<T> cardItem;
  final Future<List<T>> future;
  BankFetchList(this.cardItem, this.future);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<T>>(
      future: future,
      builder: (context, AsyncSnapshot<List<T>> snapshot) {
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
                return cardItem.makeLayout(snapshot.data![index]);
              },
            );
        }
        return const Text("Error in connection");
      },
    );
  }

  Widget loadScreen() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.black,
      ),
    );
  }
}

