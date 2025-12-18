// home.dart
// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_test_app/app_routing.dart';
import 'package:flutter_test_app/common/custom_column.dart';
import 'package:flutter_test_app/components/bottom_bar/custom_bottom_bar.dart';
import 'package:flutter_test_app/components/buttons/custom_texted_button.dart';
import 'package:flutter_test_app/extensions/theme_extensions.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onSurface,
      body: SafeArea(
        left: false,
        right: false,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            children: [
              Expanded(
                child: CustomColumn(
                  text: "Profile",
                  backgroundColor: context.colors.onSurface,
                  child: CutomTextedButton(
                    color: context.colors.onPrimary,
                    onTap: () {
                      authService.logout();
                      context.go("/login");
                    },
                    text: "Logout",
                    icon: Icons.logout,
                  ),
                ),
              ),
              CustomBottomBar(currentTab: Tabs.profile),
            ],
          ),
        ),
      ),
    );
  }
}
