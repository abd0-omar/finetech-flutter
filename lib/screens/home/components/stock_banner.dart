import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StockBanner extends StatelessWidget {
  const StockBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stocks(
              money: "\$ 20,000",
              isUp: false,
            ),
            VerticalDivider(
              color: Colors.grey,
            ),
            Stocks(
              money: "\$ 17,000",
              isUp: true,
            )
          ],
        ),
      ),
    );
  }
}

class Stocks extends StatelessWidget {
  final bool isUp;
  final String money;
  const Stocks({
    super.key,
    this.isUp = false,
    required this.money,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isUp ? Icons.arrow_upward : Icons.arrow_downward,
          color: isUp ? Colors.red : Colors.green,
          size: 42,
        ),
        Column(
          children: [
            Text(
              isUp ? "Outcome" : "Income",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              money,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ],
        ),
      ],
    );
  }
}
