// custom_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/custom_form/custom_form.dart';

class ProductCalculator extends StatelessWidget {
  const ProductCalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomForm(
            onTap: () {},
            entryHint: "Price",
            buttonText: "Calculate",
            icon: Icons.calculate,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
