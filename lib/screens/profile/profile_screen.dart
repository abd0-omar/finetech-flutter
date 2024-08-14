import 'package:final_finetech/screens/profile/components/profile_item.dart';
import 'package:final_finetech/screens/profile/components/profile_section.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var assetPath = 'assets/images/osta_abdo.jpg';
    const double avatarRadius = 100.0;

    // will be needed when adding more stuff
    // so leave it for now because we'll add more stuff
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Profile",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: const Offset(0, 6),
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: ClipOval(
                          child: Image.asset(
                            assetPath,
                            errorBuilder: (context, error, stackTrace) {
                              return const CircleAvatar(
                                radius: avatarRadius / 2,
                                backgroundColor: Colors.amber,
                                child: Text(
                                  'HA',
                                  style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            },
                            fit: BoxFit.fitWidth,
                            height: avatarRadius,
                            width: avatarRadius,
                          ),
                        ),
                      ),
                    ),
                    const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "hamada",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text("@hamada123")
                        ])
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {},
                      child: Ink(
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.mode_edit_outline_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const ProfileSection(
            items: [
              ArrowProfileItem(
                title: "My Account",
                icon: Icons.person_outline,
                content: "Make changes to your account",
              ),
              ArrowProfileItem(
                title: "Face ID/ Touch ID",
                icon: Icons.lock_outline,
                content: "Manage your device security",
                hasToggle: true,
              ),
              ArrowProfileItem(
                title: "Two-Factor Authentication",
                icon: Icons.verified_user_outlined,
                content: "Further secure your account for safety",
              ),
              ArrowProfileItem(
                title: "Log out",
                icon: Icons.logout,
                content: "Why you leaving us",
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "More",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const ProfileSection(
            items: [
              ArrowProfileItem(
                title: "Help & Support",
                icon: Icons.notifications_outlined,
                content: "",
              ),
              ArrowProfileItem(
                title: "About App",
                icon: Icons.favorite_outline,
                content: "",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
