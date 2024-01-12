import 'package:flutter/material.dart';
import 'package:todoapp/widgets/CustomTextFild.dart';

class CustomTitleAndContentFild extends StatelessWidget {
  const CustomTitleAndContentFild(
      {super.key, this.tiyelcontroller, this.contentcontroller});
  final TextEditingController? tiyelcontroller;
  final TextEditingController? contentcontroller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFild(
          controller: tiyelcontroller,
          hintText: 'Title',
        ),
        const SizedBox(height: 10),
        CustomTextFild(
          controller: contentcontroller,
          hintText: 'Content',
          maxLines: 5,
        ),
      ],
    );
  }
}
