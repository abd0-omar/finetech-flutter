import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  final int dotsNumber;
  const Dots({
    super.key,
    this.dotsNumber = 4,
  });

  final singleDot = const Padding(
    padding: EdgeInsets.only(right: 2),
    child: Icon(
      Icons.circle,
      color: Colors.black,
      size: 6,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final list = List.filled(dotsNumber, singleDot);
    return Row(
      children: [...list],
    );
  }
}
