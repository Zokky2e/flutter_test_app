// custom_column.dart
import 'package:flutter/material.dart';

class CustomColumn extends StatelessWidget {
  const CustomColumn({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.child,
  });
  final String text;
  final Color backgroundColor;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Color onPrimary = Theme.of(context).colorScheme.onPrimary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
          ),
          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Container(
            margin: EdgeInsetsGeometry.fromLTRB(12, 16, 0, 0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: onPrimary,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: backgroundColor),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: child,
          ),
        ),
      ],
    );
  }
}
