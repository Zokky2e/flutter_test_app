// custom_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/custom_form/custom_form.dart';
import 'package:flutter_test_app/components/custom_form/custom_form_text_field.dart';

class ProductCalculator extends StatelessWidget {
  const ProductCalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      child: CustomForm(
        onSubmit: (values) {},
        textFields: const [
          CustomFormTextField(
            "Price",
            TextInputType.numberWithOptions(decimal: true),
          ),
        ],
        buttonText: "Calculate",
        icon: Icons.calculate,
      ),
    );
  }
}
