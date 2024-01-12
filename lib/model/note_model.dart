class NoteModel {
  final String title;
  final String desc;
  final int id;
  final String date;
  final int coloer;
  const NoteModel({
    required this.title,
    required this.desc,
    required this.id,
    required this.date,
    required this.coloer,
  });

  factory NoteModel.json(json) {
    return NoteModel(
        coloer: json['color'],
        title: json['Title'],
        desc: json['desc'],
        id: json['id'],
        date: json['date']);
  }
}
