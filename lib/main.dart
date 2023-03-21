import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_notes/bloc_observer.dart';
import 'package:my_notes/bussiness_layer/cubits/addnotes_cubit.dart';
import 'package:my_notes/bussiness_layer/cubits/bottom_nav_bar_cubit.dart';
import 'package:my_notes/bussiness_layer/cubits/notes_cubit.dart';
import 'package:my_notes/data_layer/models/note_models.dart';
import 'package:my_notes/presentation_layer/screens/home.dart';
import 'package:my_notes/presentation_layer/screens/tasks.dart';
import 'package:my_notes/presentation_layer/widgets/const.dart';
import 'package:my_notes/presentation_layer/widgets/messege_widget.dart';

void main() async{
  await Hive.initFlutter();
  Bloc.observer=Simpleblocobserver();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(KNoteBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=>NoteCubit()),

        BlocProvider(create: (context)=>AddNoteCubit()),
        BlocProvider(create: (context)=>BottomNavBar()),


      ],
      child: MaterialApp(

debugShowCheckedModeBanner: false,
  // themeMode: ThemeMode.light,
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily:'Poppins'
        ),

        home:  Home(),
      ),
    );
  }
}
