import 'dart:convert';

class CreditCard {
  final String totalBalance;
  final String cardType;
  final String cardNumber;
  final String name;
  final String expiryDate;

  CreditCard({
    required this.totalBalance,
    required this.cardType,
    required this.cardNumber,
    required this.name,
    required this.expiryDate,
  });

  // Convert JSON to CreditCard object
  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
      totalBalance: json['total_balance'],
      cardType: json['card_type'],
      cardNumber: json['card_number'],
      name: json['name'],
      expiryDate: json['expiry_date'],
    );
  }

  // Convert CreditCard object to JSON
  Map<String, dynamic> toJson() {
    return {
      'total_balance': totalBalance,
      'card_type': cardType,
      'card_number': cardNumber,
      'name': name,
      'expiry_date': expiryDate,
    };
  }

  // Convert list of JSON objects to list of CreditCard objects
  static List<CreditCard> listFromJson(String jsonString) {
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((item) => CreditCard.fromJson(item)).toList();
  }

  // Convert list of CreditCard objects to JSON
  static String listToJson(List<CreditCard> cards) {
    final List<Map<String, dynamic>> jsonData =
        cards.map((card) => card.toJson()).toList();
    return json.encode(jsonData);
  }
}
