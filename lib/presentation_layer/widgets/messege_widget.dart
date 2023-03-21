import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/bussiness_layer/cubits/notes_cubit.dart';
import 'package:my_notes/data_layer/models/note_models.dart';
import 'package:my_notes/presentation_layer/screens/editview.dart';

class MessageNote extends StatelessWidget {
   MessageNote({Key? key, required this.model}) : super(key: key);
//   String title;
//   DateTime date;
// Color color;

final NoteModel model;

  //final color=[];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){

          return EditView(note: model,);

        }));
      },
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
            width: double.infinity,
            //height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color:Color(model.color)       ),
            child: Column(
crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(model.title,style: TextStyle(fontSize: 22,color: Colors.black87),),
                  ),
                  subtitle: Text(model.subtitle,style: TextStyle(fontSize: 18,color: Colors.black87.withOpacity(.5)),),

                  trailing: IconButton(icon: Icon(Icons.delete),onPressed: (){

                    model.delete();
                    BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                  },),

                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Text(model.date,style: TextStyle(fontSize: 12,color: Colors.white),),
                )
              ],
            ),
          ),

      ),
    );
  }
}
