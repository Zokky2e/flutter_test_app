// home.dart
// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_test_app/app_routing.dart';
import 'package:flutter_test_app/common/custom_column.dart';
import 'package:flutter_test_app/components/bottom_bar/custom_bottom_bar.dart';
import 'package:flutter_test_app/components/buttons/custom_texted_button.dart';
import 'package:flutter_test_app/components/custom_form/custom_form.dart';
import 'package:flutter_test_app/components/custom_form/custom_form_text_field.dart';
import 'package:flutter_test_app/extensions/theme_extensions.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ScrollController _scrollController = ScrollController();

  late final FocusNode _oldPasswordFocus;
  late final FocusNode _newPasswordFocus;
  final List<CustomFormTextField> userData = [
    CustomFormTextField(
      "Monthly Salary",
      TextInputType.numberWithOptions(decimal: true),
    ),
    CustomFormTextField(
      "Hourly Pay",
      TextInputType.numberWithOptions(decimal: true),
    ),
  ];
  late final List<CustomFormTextField> passwordData;

  @override
  void initState() {
    super.initState();
    _oldPasswordFocus = FocusNode();
    _newPasswordFocus = FocusNode();
    passwordData = [
      CustomFormTextField(
        "Old Password",
        TextInputType.visiblePassword,
        hideText: true,
        focusNode: _oldPasswordFocus,
      ),
      CustomFormTextField(
        "New Password",
        TextInputType.visiblePassword,
        hideText: true,
        focusNode: _newPasswordFocus,
      ),
    ];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _oldPasswordFocus.dispose();
    _newPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onSurface,
      body: SafeArea(
        left: false,
        right: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                ),
                child: Column(
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(color: context.colors.onPrimary),
                    ),
                    SizedBox(height: 16),
                    CustomColumn(
                      text: "Salary",
                      backgroundColor: context.colors.onSurface,
                      child: CustomForm(
                        onSubmit: (values) {},
                        textFields: userData,
                        buttonText: "Update Salary",
                        icon: Icons.arrow_upward,
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomColumn(
                      text: "Change Password",
                      backgroundColor: context.colors.onSurface,
                      child: CustomForm(
                        onSubmit: (values) {},
                        textFields: passwordData,
                        buttonText: "Update Password",
                        icon: Icons.arrow_upward,
                      ),
                    ),
                    SizedBox(height: 32),
                    CutomTextedButton(
                      color: context.colors.onPrimary,
                      onTap: () {
                        authService.logout();
                        context.go("/login");
                      },
                      text: "Logout",
                      icon: Icons.logout,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: CustomBottomBar(currentTab: Tabs.profile),
      ),
    );
  }
}
