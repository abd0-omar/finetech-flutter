import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/transactions.dart';

class ProductService {
  Future<List<Transaction>> getProducts() async {
    try {
      String data = await rootBundle.loadString('assets/data/transaction.json');
      final jsonResult = json.decode(data) as List<dynamic>;

      print("the json data: ");
      print(data);

      List<Transaction> products = jsonResult.map((item) {
        return Transaction.fromJson(item as Map<String, dynamic>);
      }).toList();

      return products;
    } catch (e) {
      print('Error loading JSON: $e');
      return [];
    }
  }
}
