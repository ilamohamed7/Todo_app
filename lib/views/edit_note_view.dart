import 'package:flutter/material.dart';

import 'package:todoapp/widgets/CustomTitleAndContentFild.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Edit Note',
            style: TextStyle(
              fontSize: 25,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              height: 50,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Icon(
                Icons.done,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: const CustomBodyEditNote(),
    );
  }
}

class CustomBodyEditNote extends StatelessWidget {
  const CustomBodyEditNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 16,
      ),
      child: CustomTitleAndContentFild(),
    );
  }
}
