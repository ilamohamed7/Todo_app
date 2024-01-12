import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Cubit/update_cubit.dart';
import 'package:todoapp/Databases/sqflite.dart';
import 'package:todoapp/const.dart';
import 'package:todoapp/model/note_model.dart';
import 'package:todoapp/widgets/CustomTitleAndContentFild.dart';
import 'package:todoapp/widgets/custom_bottom.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({
    super.key,
  });

  final TextEditingController? titleControler = TextEditingController();
  final TextEditingController contentControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        CustomTitleAndContentFild(
          tiyelcontroller: titleControler,
          contentcontroller: contentControler,
        ),
        const Spacer(),
        CustomBottom(
          onPressed: () async {
            BlocProvider.of<UpdateCunit>(context)
                .addNote(titleControler!.text, contentControler.text);

            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
