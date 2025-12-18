// custom_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/buttons/custom_texted_button.dart';
import 'package:flutter_test_app/extensions/theme_extensions.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    super.key,
    required this.onTap,
    required this.entryHint,
    required this.buttonText,
    required this.icon,
  });
  final VoidCallback onTap;
  final String entryHint;
  final String buttonText;
  final IconData icon;
  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  late final TextEditingController _valueController;

  @override
  void initState() {
    super.initState();
    _valueController = TextEditingController();
  }

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _valueController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(labelText: widget.entryHint),
        ),
        const SizedBox(height: 16),
        CutomTextedButton(
          onTap: widget.onTap,
          color: context.colors.onPrimary,
          text: widget.buttonText,
          icon: widget.icon,
        ),
      ],
    );
  }
}
