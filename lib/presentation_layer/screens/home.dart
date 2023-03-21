import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_notes/bussiness_layer/cubits/addnotes_cubit.dart';
import 'package:my_notes/bussiness_layer/cubits/bottom_nav_bar_cubit.dart';
import 'package:my_notes/bussiness_layer/cubits/notes_cubit.dart';
import 'package:my_notes/bussiness_layer/states/addnotes_states.dart';
import 'package:my_notes/bussiness_layer/states/bottom_nav_bar_state.dart';
import 'package:my_notes/data_layer/models/note_models.dart';
import 'package:my_notes/presentation_layer/screens/archived.dart';
import 'package:my_notes/presentation_layer/screens/done.dart';
import 'package:my_notes/presentation_layer/screens/tasks.dart';
import 'package:my_notes/presentation_layer/widgets/custom_text_field.dart';

class Home extends StatelessWidget {
// int curentindex=0;


final GlobalKey<FormState> formstate=GlobalKey();

AutovalidateMode autovalidateMode=AutovalidateMode.disabled;

String? title,subtitle;



bool isloading=false;

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<BottomNavBar,BottomNavBarState>(

        builder:(context,state)=>Scaffold(

resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                ),


                context:context , builder: (context)
            {
              return BlocConsumer<AddNoteCubit,AddNoteState>(
                  listener: (context,state){
if(state is AddNoteError){

  print("failure");
}
if(state is AddNoteScucess){
  BlocProvider.of<NoteCubit>(context).fetchAllNotes();
  Navigator.pop(context);

}
                  },
                  builder: (context,state) {
                    return ModalProgressHUD(

                      inAsyncCall:state is AddNoteLoading?true :false ,
                      child: AbsorbPointer(
                        absorbing: state is AddNoteLoading? true : false,
                        child: Padding(
                          padding:  EdgeInsets.only(left: 8.0,
                              right: 16,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: SingleChildScrollView(
                            child: Form(
                              key: formstate,
                              autovalidateMode: autovalidateMode,
                              child: Column(
                                children: [
                                  SizedBox(height: 12,),
                                  CustomTextField(
                                      hint: 'اكتب الملاحظه', onSaved: (value) {
                                    title = value;
                                  }),
                                  SizedBox(height: 16,),
                                  CustomTextField(
                                      hint: 'المحتوي', maxlines: 5, onSaved: (value) {
                                    subtitle = value;
                                  }),
                                  SizedBox(height: 12,),
                                       SizedBox(
                                         height: 28*2,
                                         child:   CustomListview()













                                       ) ,
                                   SizedBox(height: 12,),

                                  MaterialButton(

                                      color: Colors.green,
                                      onPressed: () {
                                        if (formstate.currentState!.validate()) {
                                          formstate.currentState!.save();
                                          var noteModel=NoteModel(title: title!, subtitle: subtitle!, date:DateFormat.yMd().format(DateTime.now()) , color: Colors.greenAccent.value);
                                          BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                                        } else {
                                          autovalidateMode = AutovalidateMode.always;
                                        }
                                      },
                                      child: Text("أضافه ملاحظه", style: TextStyle(
                                          fontSize: 18, color: Colors.black),))
                                ],

                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    ;
                  }
                );
            }
            );
          },
            child: Icon(Icons.add),



          ),
          body:   HomePage()
          //BlocProvider.of<BottomNavBar>(context).listpage[BlocProvider.of<BottomNavBar>(context).curentindex],
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: BlocProvider.of<BottomNavBar>(context).curentindex,
// onTap: BlocProvider.of<BottomNavBar>(context).changeBottomNavBar,
//             items: [
//            BottomNavigationBarItem(icon:Icon( Icons.table_rows_sharp),label:"ملاحظه" ) ,
//             BottomNavigationBarItem(icon:Icon( Icons.done),label:"تم الملاحظه" ),
//             BottomNavigationBarItem(icon:Icon( Icons.archive),label:"الارشيف" )
//
//           ],
//
//           ),

    ),
      );
  }
}
    class ColorItem extends StatelessWidget {
      const ColorItem({Key? key, required this.isactive, required this.color}) : super(key: key);
        final bool isactive;
            final Color color;
      @override
      Widget build(BuildContext context) {
        return isactive? CircleAvatar(
          radius: 32,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            radius: 28,
                backgroundColor: color,
          ),
        )  :  CircleAvatar(
          radius: 28,
          backgroundColor: color,
        );
      }
    }
  class CustomListview extends StatefulWidget {
    const CustomListview({Key? key}) : super(key: key);

    @override
    State<CustomListview> createState() => _CustomListviewState();
  }

  class _CustomListviewState extends State<CustomListview> {

  int currentindex=0;
  List<Color> colors=[
    Colors.deepOrangeAccent,
        Colors.purple,
    Colors.blueGrey,
    Colors.amber,
    Colors.pinkAccent,

  ];

    @override
    Widget build(BuildContext context) {
      return ListView.builder(itemBuilder: (context, index) {

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(

                     onTap: (){
                       currentindex=index;
                       BlocProvider.of<AddNoteCubit>(context).color=colors[index];
                       setState(() {

                       });
                     },

              child: ColorItem(isactive: currentindex==index, color: colors[index],)),
        );
      },
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,

      );
    }


  }