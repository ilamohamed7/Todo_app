import 'dart:ui';

import 'package:flutter/material.dart';
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
      floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextFild(
                        hintText: 'Title',
                      ),
                      SizedBox(height: 10),
                      CustomTextFild(
                        hintText: 'Content',
                        maxLines: 5,
                      ),
                      Spacer(),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Add',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.add,
                size: 36,
                color: Colors.black,
              ),
            ),
          )),
      appBar: AppBar(
        title: Text(
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
              child: Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NotesItemWidget(
                color: Colors.amber.shade300,
                titel: 'Studey Flutter',
                desg: 'Build your career with Tharwat Samy',
                dateTime: 'May 21,2024',
              ),
              NotesItemWidget(
                color: Colors.blue.shade300,
                titel: 'Studey Flutter',
                desg: 'Build your career with Tharwat Samy',
                dateTime: 'May 21,2024',
              ),
              NotesItemWidget(
                color: Colors.brown.shade300,
                titel: 'Studey Flutter',
                desg: 'Build your career with Tharwat Samy',
                dateTime: 'May 21,2024',
              ),
              NotesItemWidget(
                color: Colors.greenAccent,
                titel: 'Studey Flutter',
                desg: 'Build your career with Tharwat Samy',
                dateTime: 'May 21,2024',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFild extends StatelessWidget {
  const CustomTextFild({
    super.key,
    this.hintText,
    this.maxLines = 1,
  });
  final String? hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        // hintText: hintText,
        label: Text(
          hintText ?? '',
          style: TextStyle(
            color: Colors.cyan,
          ),
        ),
        hintStyle: TextStyle(),
        border: OutlineInputBorder(),
      ),
    );
  }
}
