import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Cubit/update_cubit.dart';
import 'package:todoapp/Databases/get_notes.dart';
import 'package:todoapp/const.dart';
import 'package:todoapp/model/note_model.dart';
import 'package:todoapp/widgets/CustomFloatingButtom.dart';
import 'package:todoapp/widgets/notes_item_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CustomFloatingButtom(),
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
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
                Icons.search,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<UpdateCunit, int>(
        builder: (context, state) {
          return FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return NotesItemWidget(
                        noteModel: snapshot.data![index],
                      );
                    },
                    itemCount: snapshot.data!.length,
                  ),
                );
              } else {
                return Center(child: Text('Not has a Notes'));
              }
            },
            future: GetNotes().getNot(),
          );
        },
      ),
    );
  }
}
