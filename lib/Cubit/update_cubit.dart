import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/Databases/sqflite.dart';
import 'package:todoapp/const.dart';
import 'package:todoapp/model/note_model.dart';

class UpdateCunit extends Cubit<int> {
  Random random = Random();
  UpdateCunit() : super(-1);
  addNote(String title, String desc) async {
    DatabaseHelper().initDatabase();
    DatabaseHelper().insertData({
      'Title': title,
      'desc': desc,
      "date": DateFormat('MMMM d, y').format(DateTime.now()).toString(),
      'color': random.nextInt(11),
    });

    var list = await DatabaseHelper().queryAll();
    emit(list.length);
  }

  deletNote(int index) async {
    DatabaseHelper().deleteData(index);
    var list = await DatabaseHelper().queryAll();
    emit(list.length + 1);
  }
}
