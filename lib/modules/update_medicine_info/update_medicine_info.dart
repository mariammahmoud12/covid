import 'package:covid19/modules/medicine_reminder_screen/cubit/reminder_cubit.dart';
import 'package:covid19/modules/medicine_reminder_screen/cubit/reminder_states.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class UpdateMedicineScreen extends StatefulWidget {
  const UpdateMedicineScreen({Key? key, required this.medicine}) : super(key: key);

  final Map medicine;

  @override
  State<UpdateMedicineScreen> createState() => _UpdateMedicineScreenState();
}

class _UpdateMedicineScreenState extends State<UpdateMedicineScreen> {
  var NameController = TextEditingController();

  var EveryDayController = TextEditingController();

  var TimesADayController = TextEditingController();

  var TimeController1 = TextEditingController();

  var TimeController2 = TextEditingController();

  var TimeController3 = TextEditingController();

  final items1 = ['Yes', 'No', 'Only as needed'];

  String? value1;

  final items2 = ['Once a day', 'Twice daily', '3 times a day'];

  String? value2;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    NameController.text = widget.medicine['name'];
    value1 = widget.medicine['everyDay'];
    value2 = widget.medicine['timesAday'];
    TimeController1.text = widget.medicine['time1'];
    TimeController2.text = widget.medicine['time2'];
    TimeController3.text = widget.medicine['time3'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReminderCubit, ReminderStates>(builder: (BuildContext context, ReminderStates state) {
      ReminderCubit cubit = ReminderCubit.get(context);
      return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(
            'Update Medicine',
            style: TextStyle(
              color: DarkBlueColor,
              fontSize: 27.0,
            ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: DarkBlueColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          elevation: 1.0,
        ),
        backgroundColor: Colors.white,
        body: Stack(alignment: AlignmentDirectional.bottomStart, children: [
          const Image(
            image: AssetImage(
              'assets/icons/back.png',
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What is the name of your med ?',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: DarkBlueColor,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    DefaultFormFeild(
                        controller: NameController,
                        type: TextInputType.name,
                        label: 'name of medicine',
                        prefix: Icons.medical_services_outlined,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Name of medicine must not be empty';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Are you need this medicine every day ?',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: DarkBlueColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          iconSize: 30.0,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: DarkBlueColor,
                          ),
                          value: value1,
                          items: items1.map(buildMenuItem).toList(),
                          onChanged: (value) => setState(() => value1 = value),
                        ),
                      ),
                    ),
                    Text(
                      'How often do you need this med?',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: DarkBlueColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          iconSize: 30.0,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: DarkBlueColor,
                          ),
                          value: value2,
                          items: items2.map(buildMenuItem).toList(),
                          onChanged: (value) => setState(
                            () {
                              value2 = value;
                              if (value2.toString() == '3 times a day') {
                                scaffoldKey.currentState?.showBottomSheet((context) => Container(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Form(
                                        key: formKey,
                                        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.end, children: [
                                          TextButton(
                                            child: Text(
                                              'Done',
                                              style: TextStyle(color: DarkBlueColor, fontSize: 24.0),
                                            ),
                                            onPressed: () async {
                                              if (formKey.currentState!.validate()) {
                                                await cubit.updateDB(
                                                  id: widget.medicine['id'],
                                                  name: NameController.text,
                                                  everyDay: value1.toString(),
                                                  timesAday: value2.toString(),
                                                  time1: TimeController1.text,
                                                  time2: TimeController2.text,
                                                  time3: TimeController3.text,
                                                );
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              }
                                            },
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          DefaultFormFeild(
                                            controller: TimeController1,
                                            type: TextInputType.datetime,
                                            label: '1st time',
                                            readOnly: true,
                                            prefix: Icons.watch_later_outlined,
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'time must not be empty';
                                              }
                                              return null;
                                            },
                                            onTap: () {
                                              showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              ).then((value) {
                                                TimeController1.text = value!.format(context).toString();
                                                print(value.format(context));
                                              });
                                            },
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          DefaultFormFeild(
                                            controller: TimeController2,
                                            type: TextInputType.datetime,
                                            label: '2nd time',
                                            readOnly: true,
                                            prefix: Icons.watch_later_outlined,
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'time must not be empty';
                                              }
                                              return null;
                                            },
                                            onTap: () {
                                              showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              ).then((value) {
                                                TimeController2.text = value!.format(context).toString();
                                                print(value.format(context));
                                              });
                                            },
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          DefaultFormFeild(
                                            controller: TimeController3,
                                            type: TextInputType.datetime,
                                            label: '3rd time',
                                            readOnly: true,
                                            prefix: Icons.watch_later_outlined,
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'time must not be empty';
                                              }
                                              return null;
                                            },
                                            onTap: () {
                                              showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              ).then((value) {
                                                TimeController3.text = value!.format(context).toString();
                                                print(value.format(context));
                                              });
                                            },
                                          ),
                                        ]))));
                              } else if (value2.toString() == 'Twice daily') {
                                scaffoldKey.currentState?.showBottomSheet((context) => Container(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Form(
                                        key: formKey,
                                        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.end, children: [
                                          TextButton(
                                            child: Text(
                                              'Done',
                                              style: TextStyle(color: DarkBlueColor, fontSize: 24.0),
                                            ),
                                            onPressed: () async {
                                              if (formKey.currentState!.validate()) {
                                                await cubit.updateDB(
                                                  id: widget.medicine['id'],
                                                  name: NameController.text,
                                                  everyDay: value1.toString(),
                                                  timesAday: value2.toString(),
                                                  time1: TimeController1.text,
                                                  time2: TimeController2.text,
                                                  time3: ' ',
                                                );

                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              }
                                            },
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          DefaultFormFeild(
                                            controller: TimeController1,
                                            type: TextInputType.datetime,
                                            label: '1st time',
                                            readOnly: true,
                                            prefix: Icons.watch_later_outlined,
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'time must not be empty';
                                              }
                                              return null;
                                            },
                                            onTap: () {
                                              showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              ).then((value) {
                                                TimeController1.text = value!.format(context).toString();
                                                print(value.format(context));
                                              });
                                            },
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          DefaultFormFeild(
                                            controller: TimeController2,
                                            type: TextInputType.datetime,
                                            label: '2nd time',
                                            readOnly: true,
                                            prefix: Icons.watch_later_outlined,
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'time must not be empty';
                                              }
                                              return null;
                                            },
                                            onTap: () {
                                              showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              ).then((value) {
                                                TimeController2.text = value!.format(context).toString();
                                                print(value.format(context));
                                              });
                                            },
                                          ),
                                        ]))));
                              } else {
                                scaffoldKey.currentState?.showBottomSheet(
                                  (context) => Container(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Form(
                                      key: formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            child: Text(
                                              'Done',
                                              style: TextStyle(color: DarkBlueColor, fontSize: 24.0),
                                            ),
                                            onPressed: () async {
                                              if (formKey.currentState!.validate()) {
                                                await cubit.updateDB(
                                                  id: widget.medicine['id'],
                                                  name: NameController.text,
                                                  everyDay: value1.toString(),
                                                  timesAday: value2.toString(),
                                                  time1: TimeController1.text,
                                                  time2: '',
                                                  time3: '',
                                                );
                                                print('dkasfkjsh');
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              }
                                            },
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          DefaultFormFeild(
                                            controller: TimeController1,
                                            type: TextInputType.datetime,
                                            label: '1st time',
                                            readOnly: true,
                                            prefix: Icons.watch_later_outlined,
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'time must not be empty';
                                              }
                                              return null;
                                            },
                                            onTap: () {
                                              showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              ).then((value) {
                                                TimeController1.text = value!.format(context).toString();
                                                print(value.format(context));
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      );
    }, listener: (BuildContext context, ReminderStates state) {
      if (state is ReminderInsertToDB) {
        Navigator.pop(context);
        Navigator.pop(context);
      }
    });
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 20.0, color: Colors.grey[700]),
        ),
      );

  Future<void> updateUser(
      {required Database database, String? name, String? timesAday, String? time1, String? time2, String? time3, required int id}) async {
    await database.rawUpdate('UPDATE Users SET name = ?, timesAday = ?,time1 = ? , time2 =? , time3 = ? WHERE id = ?',
        ["$name", "$timesAday", "$time1", "$time2", "$time3", "$id"]);
  }
}
