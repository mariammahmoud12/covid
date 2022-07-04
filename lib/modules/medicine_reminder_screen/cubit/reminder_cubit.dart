import 'package:covid19/modules/medicine_reminder_screen/cubit/reminder_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class ReminderCubit extends Cubit<ReminderStates> {
  ReminderCubit() : super(ReminderInitialState());

  static ReminderCubit get(context) => BlocProvider.of(context);

  late Database database;
  List<Map> medicines = [];

  void createDB() async {
    await openDatabase('reminders.db', version: 2, onCreate: (database, version) {
      print('Database Created');
      database
          .execute('CREATE TABLE medicines(id INTEGER PRIMARY KEY, name TEXT , everyDay TEXT, timesAday TEXT , time1 TEXT , time2 TEXT , time3 TEXT)')
          .then((value) {
        print('table created');
      }).catchError((error) {
        print('error when creating table is : ${error.toString()}');
      });
    }, onOpen: (database) {
      print('Database opened');
    }).then((value) {
      database = value;
      emit(ReminderCreateDB());
    });

    getDataFromDB(database).then((value) {
      medicines = value;
      print(medicines);

      emit(ReminderGetFromDB());
    });
  }

  Future<void> insertToDb({
    required String name,
    required String everyDay,
    required String timesAday,
    required String time1,
    String? time2,
    String? time3,
  }) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO medicines (name , everyDay, timesAday , time1 , time2 , time3 ) VALUES("$name" , "$everyDay", "$timesAday" , "$time1" , "$time2" , "$time3")')
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

  Future<List<Map>> getDataFromDB(database) async {
    return await database.rawQuery('SELECT * FROM medicines');
  }

  Future<void> updateDB({
    required int id,
    required String name,
    required String everyDay,
    required String timesAday,
    required String time1,
    String? time2,
    String? time3,
  }) async {
    await database.rawUpdate('UPDATE medicines SET name = ? , everyDay = ?, timesAday =? , time1 = ? , time2 =? , time3 =? WHERE id = ?',
        [name, everyDay, timesAday, time1, time2, time3, id]).then((value) {
      print('valueee$value');
      getDataFromDB(database).then((value) {
        medicines = value;
        print(medicines);

        emit(ReminderGetFromDB());
      });
      emit(ReminderUpdateDB());
    });
  }

  Future<void> deleteFromDB(int id) async {
    await database.rawDelete('DELETE FROM medicines WHERE id = ?', [id]).then((value) {
      getDataFromDB(database).then((value) {
        medicines = value;
        print(medicines);

        emit(ReminderGetFromDB());
      });
    });
  }

  bool isBottomSheetShown = false;

  //IconData FABIcon = Icons.edit;

  void ChangeBottomSheetState({
    required bool isShow,
    // required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    // FABIcon = icon;

    emit(ReminderChangeBottomSheetState());
  }
}
