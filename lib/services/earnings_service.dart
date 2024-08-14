// earnings_service.dart
import 'dart:convert';
import 'package:final_finetech/models/earnings.dart';
import 'package:flutter/services.dart';

class EarningsService {
  Future<List<Earnings>> getEarnings() async {
    try {
      String data =
          await rootBundle.loadString('assets/data/earnings_data.json');
      final jsonResult = json.decode(data) as List<dynamic>;
      print("the json data: ");
      print(data);

      List<Earnings> earnings = jsonResult.map((item) {
        return Earnings.fromJson(item as Map<String, dynamic>);
      }).toList();

      return earnings;
    } catch (e) {
      print('Error loading JSON: $e');
      return [];
    }
  }
}
