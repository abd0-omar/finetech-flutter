// lib/components/custom_bottom_navigation_bar.dart
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      surfaceTintColor: Colors.white,
      onDestinationSelected: onItemTapped,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      animationDuration: Duration.zero,
      backgroundColor: Colors.white,
      indicatorColor: Colors.white,
      selectedIndex: currentIndex,
      destinations: const <NavigationDestination>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.house_outlined),
          label: 'home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.account_balance_wallet),
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: 'wallet',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.analytics),
          icon: Icon(Icons.analytics_outlined),
          label: 'analytics',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.account_circle),
          icon: Icon(Icons.account_circle_outlined),
          label: 'profile',
        ),
      ],
    );
  }
}
