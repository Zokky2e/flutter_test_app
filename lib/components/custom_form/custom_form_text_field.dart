import 'package:flutter/material.dart';

class CustomFormTextField {
  final String label;
  final TextInputType keyboardType;
  final bool hideText;
  final FocusNode? focusNode;

  const CustomFormTextField(
    this.label,
    this.keyboardType, {
    this.hideText = false,
    this.focusNode,
  });
}
