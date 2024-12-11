class NoteModel {
  String noteTitle, noteDesc;
  DateTime createdAt = DateTime.now();

  NoteModel({required this.noteTitle, required this.noteDesc});
}
