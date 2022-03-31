import 'dart:convert';
import 'package:http/http.dart';
import '../models/transactionModel.dart';

class Api {
  final Uri _url = Uri.http("192.168.0.8:8080", "transactions");
  final int _timeOut = 5;

  Future<List<TransactionFeed>> findALL() async {
    final List<TransactionFeed> result = [];
    final Response response =
        await get(_url).timeout(Duration(seconds: _timeOut));
    List<dynamic> decodeJson = jsonDecode(response.body);
    return _convertInTransaction(decodeJson, result);
  }

  List<TransactionFeed> _convertInTransaction(
      List<dynamic> decodeJson, List<TransactionFeed> result) {
    List<TransactionFeed> result = decodeJson.map(
      (dynamic element) {
        return TransactionFeed.fromJson(element);
      },
    ).toList();

    return result;
  }

  Future<TransactionFeed?> save(TransactionFeed transaction) async {
    final headers = {'password': '1000', 'Content-type': 'application/json'};
    final Map<String, dynamic> modelEncode = transaction.encode();
    final String bodyEncode = jsonEncode(modelEncode);
    Response response = await post(
      _url,
      body: bodyEncode,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return transaction;
    }
  }
}
