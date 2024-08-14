import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:final_finetech/models/credit_card.dart';
import 'credit_card_card.dart';

class CreditCardBanner extends StatefulWidget {
  final List<CreditCard> initialCards;

  const CreditCardBanner({super.key, required this.initialCards});

  @override
  _CreditCardBannerState createState() => _CreditCardBannerState();
}

class _CreditCardBannerState extends State<CreditCardBanner> {
  late List<CreditCard> cards;

  @override
  void didUpdateWidget(CreditCardBanner oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("wow");
    print(oldWidget);
    if (oldWidget.initialCards != widget.initialCards) {
      setState(() {
        cards = List.from(widget.initialCards);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    cards = List.from(widget.initialCards);
  }

  void _addCard() {
    final newCard = CreditCard(
      totalBalance: "\$10,000.00",
      cardType: "MasterCard",
      cardNumber: "6789 **** **** 6942",
      name: "New User",
      expiryDate: "01/26",
    );
    setState(() {
      cards.insert(0, newCard);
    });
    // send back the data to the backend to persist it
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: _addCard,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(8),
                  padding: const EdgeInsets.all(0),
                  strokeCap: StrokeCap.square,
                  strokeWidth: 5,
                  dashPattern: const [5, 8],
                  child: Container(
                    height: 200,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.add_circle),
                  ),
                ),
              ),
            ),
            ...cards.map((card) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CreditCardCard(card: card),
                )),
          ],
        ),
      ),
    );
  }
}
