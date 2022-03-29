import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:sqflite/sqflite.dart';

import '../models/transactionModel.dart';

class ApiUserCase {
  final String _baseUrl = "http://192.168.0.8:8080/";

  Future<List<TransactionFeed>> findALL() async {
    final List<TransactionFeed> result = [];
    final path = _baseUrl + "transactions";
    final Uri url = Uri.http("192.168.0.8:8080", "transactions");
    final Response response = await get(url);
    List<dynamic> decodeJson = jsonDecode(response.body);

    for (Map<String, dynamic> element in decodeJson) {
      Map<String, dynamic> contactMap = element['contact'];
      result.add(
        TransactionFeed(
          element['id'],
          element['value'],
          Contact(
            contactMap['name'],
            contactMap['accountNumber'],
          ),
        ),
      );
    }

    print(result);
    return result;
  }
}
