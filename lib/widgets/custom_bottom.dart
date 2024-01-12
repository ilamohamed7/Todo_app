import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.cyan, borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: onPressed,
        child: const Text('Add',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            )),
      ),
    );
  }
}
