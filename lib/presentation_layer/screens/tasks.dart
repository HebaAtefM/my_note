

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/bussiness_layer/cubits/notes_cubit.dart';
import 'package:my_notes/bussiness_layer/states/notes_state.dart';
import 'package:my_notes/data_layer/models/note_models.dart';
import 'package:my_notes/presentation_layer/widgets/messege_widget.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
       elevation: 0,
        title: Text("ملاحظاتي",style: TextStyle(fontSize: 24,color: Colors.black,),),
        actions: [
          IconButton(icon:Icon(Icons.search,color: Colors.black87,), onPressed: () {  },),

        ],
      ),

body:
    // BlocProvider(
    // create: (context)=>NoteCubit(),

     BlocBuilder<NoteCubit,NoteState>(

    builder:(context,state) {
      BlocProvider.of<NoteCubit>(context).fetchAllNotes();

      List<NoteModel> notes=BlocProvider.of<NoteCubit>(context).modal ?? [];



      return Padding(

        padding: const EdgeInsets.symmetric(vertical: 8.0),

        child: ListView.builder(



          padding: EdgeInsets.zero,



          itemBuilder: (context, index) {

            return

              MessageNote(

                 model: notes[index],);

          },

          itemCount: notes.length,



        ),

      );

    }

  ),


//
// ListView.builder(itemBuilder: (context,index) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       //padding: EdgeInsets.all(20),
//       width: double.infinity,
//       height: 120,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.deepOrangeAccent
//
//
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           ListTile(
//             title: Text(
//               title, style: TextStyle(fontSize: 18, color: Colors.black87),),
//             subtitle: Text("Build your career",
//               style: TextStyle(fontSize: 18, color: Colors.grey),),
//
//             trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {},),
//
//           ),
//
//          Text('$date'),
//         ],
//       ),
//     ),
//   );
// },
// itemCount: 10,
// )
    );
  }
}
