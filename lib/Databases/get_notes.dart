import 'package:todoapp/Databases/sqflite.dart';
import 'package:todoapp/model/note_model.dart';

class GetNotes {
  Future<List<NoteModel>> getNot() async {
    var list = await DatabaseHelper().queryAll();
    List<NoteModel> noteList = [];
    for (var note in list) {
      noteList.add(NoteModel.json(note));
    }
    return noteList;
  }
}
