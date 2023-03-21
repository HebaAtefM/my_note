import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_notes/bussiness_layer/states/notes_state.dart';
import 'package:my_notes/data_layer/models/note_models.dart';
import 'package:my_notes/presentation_layer/widgets/const.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() :super(NoteInitial());
List<NoteModel>? modal;
  fetchAllNotes()async{



      var notebox = Hive.box<NoteModel>(KNoteBox);

modal=notebox.values.toList();

     emit(NoteScucess(modal! ));




  }




  }







