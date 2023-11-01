import 'package:flutter/material.dart';

class TextFieldWidgets extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  const TextFieldWidgets({
    super.key,
    required this.controller, required this.labelText, required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        label: Text(labelText),
        hintText: hintText,
      ),
    );
  }
}
