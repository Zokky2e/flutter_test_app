// custom_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/buttons/custom_texted_button.dart';
import 'package:flutter_test_app/components/custom_form/custom_form_text_field.dart';
import 'package:flutter_test_app/extensions/theme_extensions.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    super.key,
    required this.onSubmit,
    required this.textFields,
    required this.buttonText,
    required this.icon,
  });
  final Function(Map<String, String>) onSubmit;
  final List<CustomFormTextField> textFields;
  final String buttonText;
  final IconData icon;
  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  late final List<TextEditingController> _controllers;
  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.textFields.length,
      (_) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _submit() {
    final values = <String, String>{};
    for (int i = 0; i < widget.textFields.length; i++) {
      values[widget.textFields[i].label] = _controllers[i].text;
    }
    widget.onSubmit(values);
  }

  Widget _buildField(CustomFormTextField field, int index) {
    return Builder(
      builder: (context) {
        field.focusNode?.addListener(() {
          if (field.focusNode!.hasFocus) {
            Future.delayed(const Duration(milliseconds: 250), () {
              Scrollable.ensureVisible(
                context,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: 0.3, // keeps some space above
              );
            });
          }
        });

        return TextField(
          controller: _controllers[index],
          focusNode: field.focusNode,
          keyboardType: field.keyboardType,
          obscureText: field.hideText,
          textInputAction: index == widget.textFields.length - 1
              ? TextInputAction.done
              : TextInputAction.next,
          decoration: InputDecoration(labelText: field.label),
          onSubmitted: (_) {
            if (index < widget.textFields.length - 1) {
              FocusScope.of(context).nextFocus();
            } else {
              _submit();
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(widget.textFields.length, (i) {
          final textField = widget.textFields[i];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildField(textField, i),
          );
        }),

        const SizedBox(height: 16),
        CutomTextedButton(
          onTap: _submit,
          color: context.colors.onPrimary,
          text: widget.buttonText,
          icon: widget.icon,
        ),
      ],
    );
  }
}
