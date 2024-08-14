import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int index;
  const CustomAppBar({super.key, this.index = 0});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 1:
        return BaseAppBar(
          title: const Padding(
            padding: EdgeInsets.all(60),
            child: Text(
              'Wallet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  size: 30,
                ),
                onPressed: () {
                  // Handle more_vert icon press
                },
              ),
            ),
          ],
        );
      case 2:
        return const BaseAppBar();
      default:
        return const BaseAppBar();
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;

  const BaseAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    var assetPath = 'assets/images/osta_abdo.jpg';
    const double avatarSize = 8.0; // Adjust to desired radius

    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(avatarSize),
        child: leading ??
            Transform.translate(
              offset: const Offset(10, 0), // Adjust the offset as needed
              child: ClipOval(
                child: Image.asset(
                  assetPath,
                  errorBuilder: (context, error, stackTrace) {
                    return const CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: const Text(
                        'HA',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                  fit: BoxFit.cover,
                ),
              ),
            ),
      ),
      title: title ??
          Transform.translate(
            offset: const Offset(15, 0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning!',
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.1,
                      wordSpacing: 0.1,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Client Name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
      actions: actions ??
          [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Stack(
                children: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.bell),
                    onPressed: () {
                      // Handle bell icon press
                    },
                  ),
                  Positioned(
                    right: 15,
                    top: 15,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.white)),
                      constraints: const BoxConstraints(
                        minWidth: 8,
                        minHeight: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
      titleSpacing: 0, // Adjust title spacing as needed
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
