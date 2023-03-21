import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_notes/bussiness_layer/states/addnotes_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/data_layer/models/note_models.dart';
import 'package:my_notes/presentation_layer/widgets/const.dart';
class AddNoteCubit extends Cubit<AddNoteState>{
  AddNoteCubit():super(AddNoteInitial());

Color color=Colors.redAccent;
  void addNote(NoteModel model)async{
    model.color=color!.value;
    emit(AddNoteLoading());
 try{
      var notebox = Hive.box<NoteModel>(KNoteBox);


      await notebox.add(model);
      emit(AddNoteScucess());

    }on Exception catch(e){

      emit(AddNoteError());


    }


  }


}