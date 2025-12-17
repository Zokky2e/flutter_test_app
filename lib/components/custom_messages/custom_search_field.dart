// custom_column.dart
import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/buttons/custom_button.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});
  @override
  Widget build(BuildContext context) {
    Color secondary = Theme.of(context).colorScheme.secondary;
    Color onPrimary = Theme.of(context).colorScheme.onPrimary;
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 4,
        children: [
          CustomButton(onTap: () {}, icon: Icons.search, color: secondary),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.circular(30),
              ),
              height: 45,
              child: Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_shopping_cart, color: onPrimary),
                  Text(
                    "Add New Products",
                    style: TextStyle(
                      color: onPrimary,
                      fontSize: 16,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
