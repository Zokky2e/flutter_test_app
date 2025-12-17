// custom_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/buttons/custom_texted_button.dart';
import 'package:go_router/go_router.dart';

enum Tabs { home, notifs, profile }

class CustomBottomBar extends StatefulWidget {
  final Tabs initialTab;
  const CustomBottomBar({super.key, required this.initialTab});
  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    Color onPrimaryColor = Theme.of(context).colorScheme.onPrimary;
    Color secondary = Theme.of(context).colorScheme.secondary;
    return Expanded(
      flex: 0,
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          decoration: BoxDecoration(color: secondary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              CutomTextedButton(
                onTap: () {
                  setState(() {
                    widget.initialTab != Tabs.home ? context.push("/") : null;
                  });
                },
                color: widget.initialTab == Tabs.home
                    ? onPrimaryColor
                    : primaryColor,
                icon: Icons.home,
                text: "Home",
              ),
              CutomTextedButton(
                onTap: () {
                  setState(() {
                    widget.initialTab != Tabs.notifs
                        ? context.push("/history")
                        : null;
                  });
                },
                color: widget.initialTab == Tabs.notifs
                    ? onPrimaryColor
                    : primaryColor,
                icon: Icons.receipt,
                text: "History",
              ),
              CutomTextedButton(
                onTap: () {
                  setState(() {
                    widget.initialTab != Tabs.profile
                        ? context.push("/profile")
                        : null;
                  });
                },
                color: widget.initialTab == Tabs.profile
                    ? onPrimaryColor
                    : primaryColor,
                icon: Icons.person,
                text: "You",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
