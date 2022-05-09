import 'package:covid19/modules/medicine_reminder_screen/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());

  static AppCubit get(context)=> BlocProvider.of(context);

  late Database database;
  List<Map> medicines = [];

  void createDB()
  {
    openDatabase(
        'Todo.db',
        version: 1,
        onCreate: (database, version) {
          print('Database Created');
          database.execute(
              'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT , date TEXT , time TEXT , status TEXT)')
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
      emit(AppCreateDB());
    });
  }

  insertToDb({
    required String title,
    required String time,
    required String date,}) async
  {
    await database.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO tasks (title , date , time , status ) VALUES("$title" , "$date" , "$time" , "new")')
          .then((value) {
        print('$value inserted successfully');

        emit(AppInsertToDB());

        getDataFromDB(database).then((value) {
          medicines = value;
          print(medicines);

          emit(AppGetFromDB());
        });
      }).catchError((error) {
        print('error when inserting new record : $error');
      });
    });
  }

  Future <List<Map>> getDataFromDB(database) async
  {
    return await database.rawQuery('SELECT * FROM tasks');
  }

  bool isBottomSheetShown = false;
  IconData FABIcon = Icons.edit;
  void ChangeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }){
    isBottomSheetShown = isShow;
    FABIcon = icon;

    emit(AppChangeBottomSheetState());
  }
}