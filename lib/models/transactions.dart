class Transaction {
  final int id;
  final String name;
  final double price;
  final String type;

  Transaction({
    required this.id,
    required this.name,
    required this.price,
    required this.type,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as double,
      type: json['type'] as String,
    );
  }
}
