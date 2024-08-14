import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  final List<Widget> items;

  const ProfileSection({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items,
          ),
        ),
      ],
    );
  }
}
