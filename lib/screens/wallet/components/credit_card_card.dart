import 'package:flutter/material.dart';
import '../../../models/credit_card.dart';
import 'dots.dart';

class CreditCardCard extends StatelessWidget {
  final CreditCard card;
  const CreditCardCard({
    super.key,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    return _CreditCardCard(
      totalBalance: card.totalBalance,
      cardType: card.cardType,
      cardNumber: card.cardNumber,
      name: card.name,
      expiryDate: card.expiryDate,
    );
  }
}

class _CreditCardCard extends StatelessWidget {
  final String totalBalance;
  final String cardType;
  final String cardNumber;
  final String name;
  final String expiryDate;

  const _CreditCardCard({
    required this.totalBalance,
    required this.cardType,
    required this.cardNumber,
    required this.name,
    required this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    Color cardBackgroundColor;
    switch (cardType.toLowerCase()) {
      case "visa":
        cardBackgroundColor = Colors.white;
        break;
      case "mastercard":
        cardBackgroundColor = Colors.yellow.shade100;
        break;
      default:
        cardBackgroundColor = Colors.blueGrey.shade100;
        break;
    }

    return Container(
      width: 300,
      height: 210,
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 17, top: 15, left: 12, right: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Total Balance",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          totalBalance,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.all(3),
                      child: Text(
                        cardType,
                        style: const TextStyle(
                            color: Colors.white,
                            letterSpacing: 0.0001,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        cardNumber.substring(0, 5),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(right: 20.0, top: 4),
                        child: Dots()),
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0, top: 4),
                      child: Dots(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: Text(
                        cardNumber.substring(15),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 64,
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Exp",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      expiryDate,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
