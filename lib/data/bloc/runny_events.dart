abstract class RunnyEvents {}

class AddNoteEvent extends RunnyEvents {
  // NoteModel addNote;

  Map<String, dynamic> addNote;

  AddNoteEvent({required this.addNote});
}

class FetchAllNotes extends RunnyEvents {}

class UpdateNoteEvent extends RunnyEvents {
  // NoteModel updateNote;

  Map<String, dynamic> updateNote;

  int uIndex;

  UpdateNoteEvent({required this.uIndex, required this.updateNote});
}

class DeleteNoteEvent extends RunnyEvents {
  int dIndex;

  DeleteNoteEvent({required this.dIndex});
}
