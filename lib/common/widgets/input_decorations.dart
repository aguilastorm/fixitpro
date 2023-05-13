import 'package:fixitpro/common/utils/app_theme.dart';
import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primary),
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.primary, width: 2)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: AppTheme.primary)
            : null);
  }
}
