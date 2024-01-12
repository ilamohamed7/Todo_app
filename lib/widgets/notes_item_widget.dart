import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Cubit/update_cubit.dart';
import 'package:todoapp/Databases/sqflite.dart';
import 'package:todoapp/const.dart';
import 'package:todoapp/model/note_model.dart';
import 'package:todoapp/views/edit_note_view.dart';

class NotesItemWidget extends StatelessWidget {
  const NotesItemWidget({super.key, required this.noteModel});

  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditNoteView(),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: colorList[noteModel.coloer],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        noteModel.title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        noteModel.desc,
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () async {
                        await UpdateCunit().deletNote(noteModel.id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      noteModel.date,
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
