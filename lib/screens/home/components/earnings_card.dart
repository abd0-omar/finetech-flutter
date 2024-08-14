// product_card.dart

import 'package:flutter/material.dart';
import 'package:final_finetech/models/transactions.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width = 350,
    required this.product,
    required this.onPress,
  });

  final double width;
  final Transaction product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconType(productType: product.type),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(color: Colors.black),
                          ),
                          Text(product.type),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    product.type == "Salary"
                        ? "+\$${product.price.toStringAsFixed(2)}"
                        : "-\$${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                        color: product.type == "Salary"
                            ? Colors.green
                            : Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class IconType extends StatelessWidget {
  final String productType;
  const IconType({
    super.key,
    required this.productType,
  });

  final subscriptionFee = const Icon(
    Icons.laptop,
    color: Colors.yellow,
  );

  final saving = const Icon(
    Icons.download,
    color: Colors.blue,
  );

  final shoppingFee = const Icon(
    Icons.shopping_bag,
    color: Colors.pink,
  );

  final creditCard = const Icon(
    Icons.credit_card,
    color: Colors.green,
  );

  @override
  Widget build(BuildContext context) {
    Icon iconType = const Icon(Icons.not_interested);
    Color backGroundColor = Colors.white;
    switch (productType) {
      case "Subscription Fee":
        iconType = subscriptionFee;
        backGroundColor = Colors.yellow.shade100;
        break;
      case "Saving":
        iconType = saving;
        backGroundColor = Colors.blue.shade100;
        break;
      case "Shopping fee":
        iconType = shoppingFee;
        backGroundColor = Colors.pink.shade100;
        break;
      case "Salary":
        iconType = creditCard;
        backGroundColor = Colors.green.shade100;
        break;
    }
    return Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: backGroundColor,
          shape: BoxShape.circle,
        ),
        child: iconType);
  }
}

// name, type, price
// if type == salary, price would be green with a +
// else price would be red with a -
