import 'package:covid19/modules/medicine_reminder_screen/cubit/reminder_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class ReminderCubit extends Cubit<ReminderStates>{
  ReminderCubit():super(ReminderInitialState());

  static ReminderCubit get(context)=> BlocProvider.of(context);

  late Database database;
  List<Map> medicines = [];

  void createDB()
  {
    openDatabase(
        'medicine.db',
        version: 1,
        onCreate: (database, version) {
          print('Database Created');
          database.execute(
              'CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT , timesAday TEXT , time1 TEXT , time2 TEXT , time3 TEXT)')
              .then((value) {
            print('table created');
          }).catchError((error) {
            print('error when creating table is : ${error.toString()}');
          });
        },
        onOpen: (database) {
          print('Database opened');
        }
    ).then((value) {
      database = value;
      emit(ReminderCreateDB());
    });
  }

  insertToDb({
    required String name,
    required String timesAday,
    required String time1,
    String? time2,
    String? time3,}) async
  {
    await database.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO tasks (name ,timesAday , time1 , time2 , time3 ) VALUES("$name" , "$timesAday" , "$time1" , "$time2" , "$time3")')
          .then((value) {
        print('$value inserted successfully');

        emit(ReminderInsertToDB());

        getDataFromDB(database).then((value) {
          medicines = value;
          print(medicines);

          emit(ReminderGetFromDB());
        });
      }).catchError((error) {
        print('error when inserting new record : $error');
      });
    });
  }

  Future <List<Map>> getDataFromDB(database) async
  {
    return await database.rawQuery('SELECT * FROM medicine');
  }

  bool isBottomSheetShown = false;
  IconData FABIcon = Icons.edit;
  void ChangeBottomSheetState({
    required bool isShow,
   // required IconData icon,
  }){
    isBottomSheetShown = isShow;
   // FABIcon = icon;

    emit(ReminderChangeBottomSheetState());
  }
}