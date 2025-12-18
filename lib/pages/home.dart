// home.dart
// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_test_app/common/custom_column.dart';
import 'package:flutter_test_app/components/bottom_bar/custom_bottom_bar.dart';
import 'package:flutter_test_app/components/product_calculator/product_calculator.dart';
import 'package:flutter_test_app/extensions/theme_extensions.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  text: "Money Saver",
                  backgroundColor: context.colors.onSurface,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  child: Center(child: ProductCalculator()),
                ),
              ),
              CustomBottomBar(currentTab: Tabs.home),
            ],
          ),
        ),
      ),
    );
  }
}
