import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/bussiness_layer/states/bottom_nav_bar_state.dart';
import 'package:my_notes/presentation_layer/screens/archived.dart';
import 'package:my_notes/presentation_layer/screens/done.dart';
import 'package:my_notes/presentation_layer/screens/tasks.dart';

class BottomNavBar extends Cubit<BottomNavBarState>{
  BottomNavBar():super(BottomNavBarInitial());
  int curentindex=0;

  List listpage=[
    HomePage(),
    Done(),
    Archived()
  ];

  void changeBottomNavBar(int index)async {
    emit(BottomNavBarloading());

    try {
      curentindex = index;
      emit(BottomNavBarSuccess());
    } catch (e) {
      emit(BottomNavBarError());
    }
  }}