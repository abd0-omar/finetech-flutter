// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// import '../models/credit_card.dart';

// class CreditCardService {
//   // Load cards from the local storage
//   Future<List<CreditCard>> loadCards() async {
//     try {
//       final directory = await getApplicationDocumentsDirectory();
//       final file = File('${directory.path}/credit_cards.json');

//       if (await file.exists()) {
//         final jsonString = await file.readAsString();
//         return CreditCard.listFromJson(jsonString);
//       } else {
//         print('File does not exist.');
//         return [];
//       }
//     } catch (e) {
//       print('Error loading cards: $e');
//       return [];
//     }
//   }

//   // Save cards to the local storage
//   Future<void> saveCards(List<CreditCard> cards) async {
//     try {
//       final directory = await getApplicationDocumentsDirectory();
//       final file = File('${directory.path}/credit_cards.json');
//       final jsonString = CreditCard.listToJson(cards);
//       await file.writeAsString(jsonString);
//     } catch (e) {
//       print('Error saving cards: $e');
//     }
//   }

//   // Preload file from assets to local storage
//   Future<void> preloadFile() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/credit_cards.json');

//     try {
//       final data = await rootBundle.loadString('assets/data/credit_cards.json');
//       await file.writeAsString(data);
//       print('File preloaded successfully.');
//     } catch (e) {
//       print('Error preloading file: $e');
//     }
//   }
// }

import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/credit_card.dart';

class CreditCardService {
  Future<List<CreditCard>> getCreditCards() async {
    try {
      // Load the JSON file from assets
      String data =
          await rootBundle.loadString('assets/data/credit_cards.json');
      print("The JSON data:");
      print(data);

      // Decode the JSON data
      final jsonResult = json.decode(data) as List<dynamic>;

      // Map the JSON data to a list of CreditCard objects
      List<CreditCard> creditCards = jsonResult.map((item) {
        return CreditCard.fromJson(item as Map<String, dynamic>);
      }).toList();

      return creditCards;
    } catch (e) {
      print('Error loading JSON: $e');
      return [];
    }
  }
}
