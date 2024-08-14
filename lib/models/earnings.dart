class Earnings {
  final String company;
  final double money;

  Earnings({
    required this.company,
    required this.money,
  });

  factory Earnings.fromJson(Map<String, dynamic> json) {
    return Earnings(
      company: json['company'] as String,
      money: json['money'] as double,
    );
  }
}
