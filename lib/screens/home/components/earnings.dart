// categories.dart
import 'package:final_finetech/models/earnings.dart';
import 'package:flutter/material.dart';
import 'section_title.dart';

class EarningsList extends StatelessWidget {
  final List<Earnings> earnings;
  final int _index;
  final List<Color> randomColorList = [
    Colors.redAccent,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.yellowAccent,
    Colors.brown,
  ];

  EarningsList({
    super.key,
    required this.earnings,
    required int index,
  }) : _index = index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Earnings",
            press: () {},
            index: _index,
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              earnings.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 30 : 20,
                  right: index == earnings.length - 1 ? 30 : 0,
                ),
                child: EarningsCard(
                  company: earnings[index].company,
                  money: earnings[index].money,
                  randomColor: randomColorList[index % randomColorList.length],
                  press: () {},
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EarningsCard extends StatelessWidget {
  final String company;
  final double money;
  final GestureTapCallback press;
  final Color randomColor;

  const EarningsCard({
    super.key,
    required this.company,
    required this.money,
    required this.press,
    required this.randomColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            height: 150,
            width: 130,
            decoration: BoxDecoration(
              color: randomColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Text(
                      company[0]), // Display the first letter of the company
                ),
                Column(
                  children: [
                    Text(company),
                    Text("\$ ${money.toStringAsFixed(2)}"),
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
