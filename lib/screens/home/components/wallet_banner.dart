import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalletBalanceBanner extends StatelessWidget {
  const WalletBalanceBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage("assets/images/Mohamed_Salah_2018.jpg"))),
      child: const Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Balance",
            style: TextStyle(color: Colors.white),
          ),
          Row(
            children: [
              Text(
                "\$25,000.40",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "My Wallet",
                style: TextStyle(color: Colors.white),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.arrow_circle_right,
                  size: 50,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
