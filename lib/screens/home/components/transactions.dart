import 'package:final_finetech/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:final_finetech/models/transactions.dart';
import 'earnings_card.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> products;
  final String title;
  final int _index;

  const TransactionsList({
    super.key,
    required this.products,
    required this.title,
    required int index,
  }) : _index = index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(title: title, press: () {}, index: _index),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: _index == 1
              ? null
              : const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Today"),
                ),
        ),
        Center(
          child: SizedBox(
            height: 400,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(
                  products.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      top: index == 0 ? 20 : 10,
                      bottom: index == products.length - 1 ? 20 : 0,
                    ),
                    child: ProductCard(
                      product: products[index],
                      onPress: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
