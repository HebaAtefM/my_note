import 'package:my_notes/data_layer/models/note_models.dart';

abstract class NoteState{}

class NoteInitial extends NoteState{}

class NoteLoading extends NoteState{}
class NoteScucess extends NoteState{

 final List<NoteModel> notes;

  NoteScucess(this.notes);







}

class NoteError extends NoteState{}