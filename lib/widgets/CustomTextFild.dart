import 'package:flutter/material.dart';

class CustomTextFild extends StatelessWidget {
  const CustomTextFild(
      {super.key, this.hintText, this.maxLines = 1, this.controller});
  final String? hintText;
  final int? maxLines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        // hintText: hintText,
        label: Text(
          hintText ?? '',
          style: const TextStyle(
            color: Colors.cyan,
          ),
        ),

        border: const OutlineInputBorder(),
      ),
    );
  }
}
