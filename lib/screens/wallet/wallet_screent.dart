import 'package:flutter/material.dart';
import 'package:final_finetech/models/transactions.dart';
import 'package:final_finetech/screens/home/components/transactions.dart';
import 'package:final_finetech/models/credit_card.dart';
import 'package:final_finetech/screens/wallet/components/credit_card_banner.dart';

class WalletScreen extends StatefulWidget {
  final List<Transaction> products;
  final int index;
  final List<CreditCard> creditCards;

  const WalletScreen({
    super.key,
    required this.products,
    required this.index,
    required this.creditCards,
  });

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  // late List<CreditCard> creditCards;

  // @override
  // void initState() {
  //   super.initState();
  //   creditCards = widget.creditCards; // Initialize credit cards
  // }

  // void _handleAddCard() {
  //   final newCard = CreditCard(
  //     totalBalance: "\$10,000.00",
  //     cardType: "MasterCard",
  //     cardNumber: "6789 **** **** 6942",
  //     name: "New User",
  //     expiryDate: "01/26",
  //   );

  //   setState(() {
  //     creditCards.insert(0, newCard); // Add new card to the list
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardBanner(
              initialCards: widget.creditCards,
            ), // Pass the function here
            TransactionsList(
              products: widget.products,
              title: 'Transactions',
              index: widget.index,
            ),
          ],
        ),
      ),
    );
  }
}
