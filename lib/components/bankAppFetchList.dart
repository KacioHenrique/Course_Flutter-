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
          case ConnectionState.none:
            return errorWidget("none");
          case ConnectionState.waiting:
            return loadWidget();
          case ConnectionState.active:
            return loadWidget();
          case ConnectionState.done:
            if (snapshot.hasData && snapshot.requireData.isNotEmpty) {
              return successWidget(snapshot.requireData);
            } else if (snapshot.requireData.isEmpty) {
              return noContentWidget();
            } else {
              return errorWidget();
            }
        }
      },
    );
  }

  Widget noContentWidget() {
    return Center(
      child: Column(
        children: const [
          Icon(
            Icons.announcement,
            color: Colors.white,
            size: 124,
          ),
          Text(
            'No content',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  Widget errorWidget([String textFeedBack = 'Error in connection Server']) {
    return Center(
      child: Text(
        textFeedBack,
        style:
            const TextStyle(color: Colors.red, backgroundColor: Colors.black),
      ),
    );
  }

  Widget successWidget(List<T> model) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: model.length,
      itemBuilder: (BuildContext context, int index) {
        return cardItem.makeLayout(model[index]);
      },
    );
  }

  Widget loadWidget() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.black,
      ),
    );
  }
}
