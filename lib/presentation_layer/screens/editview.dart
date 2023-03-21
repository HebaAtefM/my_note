import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/bussiness_layer/cubits/notes_cubit.dart';
import 'package:my_notes/data_layer/models/note_models.dart';
import 'package:my_notes/presentation_layer/screens/home.dart';
import 'package:my_notes/presentation_layer/widgets/custom_text_field.dart';

class EditView extends StatefulWidget {
  const EditView({Key? key, required this.note}) : super(key: key);
final NoteModel note;

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {

    String? title,subtitle;
    List<Color> colors=[
      Colors.deepOrangeAccent,
      Colors.purple,
      Colors.blueGrey,
      Colors.amber,
      Colors.pinkAccent,

    ];

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("تعديل الملاحظات",style: TextStyle(fontSize: 24,color: Colors.black,),),
        actions: [
          IconButton(icon:Icon(Icons.task_alt,color: Colors.black87,), onPressed: () {
            widget.note.title=title ?? widget.note.title;
            widget.note.subtitle=subtitle ?? widget.note.subtitle;
            widget.note.save();
            BlocProvider.of<NoteCubit>(context).fetchAllNotes();
            Navigator.pop(context);


          },),

        ],
      ),

      body:Padding(
      padding: const EdgeInsets.all( 16.0),
      child: Column(
          children: [
            SizedBox(height: 12,),
            CustomTextField(hint: widget.note.title,onchanged:(value){
              title=value;
            },)     ,
            SizedBox(height: 16,),
            CustomTextField(hint:widget.note.subtitle,maxlines: 5,onchanged:(value){
              subtitle=value;
            },)     ,
            SizedBox(height: 12,),
           // CustomListview(),
          ],


      ),
        ),
    );
  }
}
