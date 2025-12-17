// home.dart
// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/bottom_bar/custom_bottom_bar.dart';
import 'package:flutter_test_app/common/custom_column.dart';
import 'package:flutter_test_app/components/custom_messages/custom_search_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Color surface = Theme.of(context).colorScheme.surface;
    Color onSurface = Theme.of(context).colorScheme.onSurface;
    return Scaffold(
      backgroundColor: onSurface,
      body: SafeArea(
        left: false,
        right: false,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            verticalDirection: VerticalDirection.up,
            children: [
              CustomBottomBar(initialTab: Tabs.home),
              Expanded(
                child: Row(
                  verticalDirection: VerticalDirection.up,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomColumn(
                        text: "",
                        backgroundColor: onSurface,
                        child: Text(
                          "my servers",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: CustomColumn(
                        text: "Messages",
                        backgroundColor: surface,
                        child: Column(
                          children: [
                            Expanded(flex: 1, child: CustomSearchField()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
