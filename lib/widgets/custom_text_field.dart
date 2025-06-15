import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    this.onSaved,
    required this.hint,
    required this.maxLines,
  });
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String hint;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Feildis required";
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: const Color(0xFF6C63FF),
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        border: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey.shade700),
    );
  }
}
