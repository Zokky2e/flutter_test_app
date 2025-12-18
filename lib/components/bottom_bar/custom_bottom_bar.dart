// custom_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/buttons/custom_texted_button.dart';
import 'package:go_router/go_router.dart';

enum Tabs { home, notifs, profile }

class CustomBottomBar extends StatelessWidget {
  final Tabs currentTab;
  const CustomBottomBar({super.key, required this.currentTab});
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    Color onPrimaryColor = Theme.of(context).colorScheme.onPrimary;
    Color secondary = Theme.of(context).colorScheme.secondary;
    return Container(
      decoration: BoxDecoration(color: secondary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          CutomTextedButton(
            onTap: () {
              if (currentTab != Tabs.home) {
                context.go("/");
              }
            },
            color: currentTab == Tabs.home ? onPrimaryColor : primaryColor,
            icon: Icons.home,
            text: "Home",
          ),
          CutomTextedButton(
            onTap: () {
              if (currentTab != Tabs.notifs) {
                context.go("/history");
              }
            },
            color: currentTab == Tabs.notifs ? onPrimaryColor : primaryColor,
            icon: Icons.receipt,
            text: "History",
          ),
          CutomTextedButton(
            onTap: () {
              if (currentTab != Tabs.profile) {
                context.go("/profile");
              }
            },
            color: currentTab == Tabs.profile ? onPrimaryColor : primaryColor,
            icon: Icons.person,
            text: "You",
          ),
        ],
      ),
    );
  }
}
