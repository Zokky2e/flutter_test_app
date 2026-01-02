// custom_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_test_app/app_routing.dart';
import 'package:flutter_test_app/components/custom_form/custom_form.dart';
import 'package:flutter_test_app/components/custom_form/custom_form_text_field.dart';
import 'package:flutter_test_app/components/product_calculator/product_model_output.dart';
import 'package:flutter_test_app/extensions/theme_extensions.dart';

class ProductCalculator extends StatelessWidget {
  const ProductCalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      child: CustomForm(
        onSubmit: (values) async {
          ProductModelOutput result = await productService.calculatePrice(
            price: double.parse(values["Price"]!),
          );
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Expanded(
                child: AlertDialog(
                  title: Text(
                    'The magic number',
                    style: TextStyle(color: context.colors.onPrimary),
                  ),
                  content: Text(
                    'To buy this you need to work for ${result.workingHours} hour/s',
                    style: TextStyle(color: context.colors.onPrimary),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Purchase'),
                    ),
                  ],
                ),
              );
            },
          );
        },
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
