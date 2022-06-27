import 'package:covid19/modules/medicine_reminder_screen/cubit/reminder_cubit.dart';
import 'package:covid19/modules/medicine_reminder_screen/cubit/reminder_states.dart';
import 'package:covid19/modules/medicine_reminder_screen/medicine_reminder_screen.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({Key? key}) : super(key: key);

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {

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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ReminderCubit()..createDB(),
      child: BlocConsumer<ReminderCubit , ReminderStates>(
        builder: (BuildContext context , ReminderStates state)
        {
          ReminderCubit cubit = ReminderCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                'Add Medicine',
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
              Padding(
                padding: const EdgeInsets.all(20.0),
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
                      margin: EdgeInsets.only(bottom: 20.0),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                          onChanged: (value) => setState(() => this.value1 = value),
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
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                          onChanged: (value) => setState(() {
                            this.value2 = value;
                            if (value2.toString() == '3 times a day') {
                              scaffoldKey.currentState?.showBottomSheet((context) =>
                                  Container(
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
                                                    style: TextStyle(
                                                      color: DarkBlueColor,
                                                      fontSize: 24.0
                                                    ),
                                                  ),
                                                  onPressed: (){
                                                    if (formKey.currentState!.validate()) {
                                                      cubit.insertToDb(
                                                          name: NameController.text,
                                                          timesAday: TimesADayController.text,
                                                          time1: TimeController1.text,
                                                          time2:TimeController2.text,
                                                          time3:TimeController3.text,
                                                      );
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
                                                      TimeController1.text = value!
                                                          .format(context)
                                                          .toString();
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
                                                      TimeController2.text = value!
                                                          .format(context)
                                                          .toString();
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
                                                      TimeController3.text = value!
                                                          .format(context)
                                                          .toString();
                                                      print(value.format(context));
                                                    });
                                                  },
                                                ),

                                              ]
                                          )
                                      )
                                  )
                              );
                            }
                            else if(value2.toString() == 'Twice daily') {
                              scaffoldKey.currentState?.showBottomSheet((context) =>
                                  Container(
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
                                                    style: TextStyle(
                                                        color: DarkBlueColor,
                                                        fontSize: 24.0
                                                    ),
                                                  ),
                                                  onPressed: (){
                                                    if (formKey.currentState!.validate()) {
                                                      cubit.insertToDb(
                                                        name: NameController.text,
                                                        timesAday: TimesADayController.text,
                                                        time1: TimeController1.text,
                                                        time2: TimeController2.text,
                                                        time3: 'null',
                                                      );
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
                                                      TimeController1.text = value!
                                                          .format(context)
                                                          .toString();
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
                                                      TimeController2.text = value!
                                                          .format(context)
                                                          .toString();
                                                      print(value.format(context));
                                                    });
                                                  },
                                                ),
                                              ]))));
                            }
                            else {
                              scaffoldKey.currentState?.showBottomSheet((context) =>
                                  Container(
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
                                                    style: TextStyle(
                                                        color: DarkBlueColor,
                                                        fontSize: 24.0
                                                    ),
                                                  ),
                                                  onPressed: (){
                                                    if (formKey.currentState!.validate()) {
                                                      cubit.insertToDb(
                                                        name: NameController.text,
                                                        timesAday: TimesADayController.text,
                                                        time1: TimeController1.text,
                                                        time2:'null',
                                                        time3:'null',
                                                      );
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
                                                      TimeController1.text = value!
                                                          .format(context)
                                                          .toString();
                                                      print(value.format(context));
                                                    });
                                                  },
                                                ),
                                              ]))));
                            }
                          }),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Container(
                        height: 50.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            color: TealColor,
                            borderRadius: BorderRadius.circular(8.0)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: MaterialButton(
                          onPressed: () {
                             navigator(context, MedicineReminderScreen());
                          },
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          );
        },
          listener: (BuildContext context , ReminderStates state) {
            if (state is ReminderInsertToDB)
             { Navigator.pop(context);}
          }
      ),
    );
    // return Scaffold(
    //   key: scaffoldKey,
    //   appBar: AppBar(
    //     title: Text(
    //       'Add Medicine',
    //       style: TextStyle(
    //         color: DarkBlueColor,
    //         fontSize: 27.0,
    //       ),
    //     ),
    //     backgroundColor: Colors.white,
    //     leading: IconButton(
    //       icon: Icon(
    //         Icons.arrow_back_ios,
    //         color: DarkBlueColor,
    //       ),
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //     ),
    //     centerTitle: true,
    //     elevation: 1.0,
    //   ),
    //   backgroundColor: Colors.white,
    //   body: Stack(alignment: AlignmentDirectional.bottomStart, children: [
    //     const Image(
    //       image: AssetImage(
    //         'assets/icons/back.png',
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.all(20.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             'What is the name of your med ?',
    //             style: TextStyle(
    //               fontSize: 16.0,
    //               color: DarkBlueColor,
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 8.0,
    //           ),
    //           DefaultFormFeild(
    //               controller: NameController,
    //               type: TextInputType.name,
    //               label: 'name of medicine',
    //               prefix: Icons.medical_services_outlined,
    //               validate: (String? value) {
    //                 if (value!.isEmpty) {
    //                   return 'Name of medicine must not be empty';
    //                 }
    //                 return null;
    //               }),
    //           const SizedBox(
    //             height: 20.0,
    //           ),
    //           Text(
    //             'Are you need this medicine every day ?',
    //             style: TextStyle(
    //               fontSize: 16.0,
    //               color: DarkBlueColor,
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 5.0,
    //           ),
    //           Container(
    //             margin: EdgeInsets.only(bottom: 20.0),
    //             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(6),
    //               border: Border.all(color: Colors.grey, width: 2),
    //             ),
    //             child: DropdownButtonHideUnderline(
    //               child: DropdownButton<String>(
    //                 isExpanded: true,
    //                 iconSize: 30.0,
    //                 icon: Icon(
    //                   Icons.arrow_drop_down,
    //                   color: DarkBlueColor,
    //                 ),
    //                 value: value1,
    //                 items: items1.map(buildMenuItem).toList(),
    //                 onChanged: (value) => setState(() => this.value1 = value),
    //               ),
    //             ),
    //           ),
    //           Text(
    //             'How often do you need this med?',
    //             style: TextStyle(
    //               fontSize: 16.0,
    //               color: DarkBlueColor,
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 5.0,
    //           ),
    //           Container(
    //             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(6),
    //               border: Border.all(color: Colors.grey, width: 2),
    //             ),
    //             child: DropdownButtonHideUnderline(
    //               child: DropdownButton<String>(
    //                 isExpanded: true,
    //                 iconSize: 30.0,
    //                 icon: Icon(
    //                   Icons.arrow_drop_down,
    //                   color: DarkBlueColor,
    //                 ),
    //                 value: value2,
    //                 items: items2.map(buildMenuItem).toList(),
    //                 onChanged: (value) => setState(() {
    //                   this.value2 = value;
    //                   if (value2.toString() == '3 times a day') {
    //                     scaffoldKey.currentState?.showBottomSheet((context) =>
    //                         Container(
    //                            padding: const EdgeInsets.all(15.0),
    //                             child: Form(
    //                                 key: formKey,
    //                                 child: Column(
    //                                     mainAxisSize: MainAxisSize.min,
    //                                     crossAxisAlignment: CrossAxisAlignment.end,
    //                                     children: [
    //                                       TextButton(
    //                                         child: Text(
    //                                             'Done',
    //                                           style: TextStyle(
    //                                             color: DarkBlueColor,
    //                                             fontSize: 24.0
    //                                           ),
    //                                         ),
    //                                         onPressed: (){
    //                                           Navigator.pop(context);
    //                                         },
    //                                       ),
    //                                       const SizedBox(
    //                                         height: 15.0,
    //                                       ),
    //                                       DefaultFormFeild(
    //                                         controller: TimeController1,
    //                                         type: TextInputType.datetime,
    //                                         label: '1st time',
    //                                         prefix: Icons.watch_later_outlined,
    //                                         validate: (String? value) {
    //                                           if (value!.isEmpty) {
    //                                             return 'time must not be empty';
    //                                           }
    //                                           return null;
    //                                         },
    //                                         onTap: () {
    //                                           showTimePicker(
    //                                             context: context,
    //                                             initialTime: TimeOfDay.now(),
    //                                           ).then((value) {
    //                                             TimeController1.text = value!
    //                                                 .format(context)
    //                                                 .toString();
    //                                             print(value.format(context));
    //                                           });
    //                                         },
    //                                       ),
    //                                       const SizedBox(
    //                                         height: 15.0,
    //                                       ),
    //                                       DefaultFormFeild(
    //                                         controller: TimeController2,
    //                                         type: TextInputType.datetime,
    //                                         label: '2nd time',
    //                                         prefix: Icons.watch_later_outlined,
    //                                         validate: (String? value) {
    //                                           if (value!.isEmpty) {
    //                                             return 'time must not be empty';
    //                                           }
    //                                           return null;
    //                                         },
    //                                         onTap: () {
    //                                           showTimePicker(
    //                                             context: context,
    //                                             initialTime: TimeOfDay.now(),
    //                                           ).then((value) {
    //                                             TimeController2.text = value!
    //                                                 .format(context)
    //                                                 .toString();
    //                                             print(value.format(context));
    //                                           });
    //                                         },
    //                                       ),
    //                                       const SizedBox(
    //                                         height: 15.0,
    //                                       ),
    //                                       DefaultFormFeild(
    //                                         controller: TimeController3,
    //                                         type: TextInputType.datetime,
    //                                         label: '3rd time',
    //                                         prefix: Icons.watch_later_outlined,
    //                                         validate: (String? value) {
    //                                           if (value!.isEmpty) {
    //                                             return 'time must not be empty';
    //                                           }
    //                                           return null;
    //                                         },
    //                                         onTap: () {
    //                                           showTimePicker(
    //                                             context: context,
    //                                             initialTime: TimeOfDay.now(),
    //                                           ).then((value) {
    //                                             TimeController3.text = value!
    //                                                 .format(context)
    //                                                 .toString();
    //                                             print(value.format(context));
    //                                           });
    //                                         },
    //                                       ),
    //
    //                                     ]))));
    //                   }
    //                   else if(value2.toString() == 'Twice daily') {
    //                     scaffoldKey.currentState?.showBottomSheet((context) =>
    //                         Container(
    //                           padding: const EdgeInsets.all(15.0),
    //                             child: Form(
    //                                 key: formKey,
    //                                 child: Column(
    //                                     mainAxisSize: MainAxisSize.min,
    //                                     crossAxisAlignment: CrossAxisAlignment.end,
    //                                     children: [
    //                                       TextButton(
    //                                         child: Text(
    //                                           'Done',
    //                                           style: TextStyle(
    //                                               color: DarkBlueColor,
    //                                               fontSize: 24.0
    //                                           ),
    //                                         ),
    //                                         onPressed: (){
    //                                           Navigator.pop(context);
    //                                         },
    //                                       ),
    //                                       const SizedBox(
    //                                         height: 15.0,
    //                                       ),
    //                                       DefaultFormFeild(
    //                                         controller: TimeController1,
    //                                         type: TextInputType.datetime,
    //                                         label: '1st time',
    //                                         prefix: Icons.watch_later_outlined,
    //                                         validate: (String? value) {
    //                                           if (value!.isEmpty) {
    //                                             return 'time must not be empty';
    //                                           }
    //                                           return null;
    //                                         },
    //                                         onTap: () {
    //                                           showTimePicker(
    //                                             context: context,
    //                                             initialTime: TimeOfDay.now(),
    //                                           ).then((value) {
    //                                             TimeController1.text = value!
    //                                                 .format(context)
    //                                                 .toString();
    //                                             print(value.format(context));
    //                                           });
    //                                         },
    //                                       ),
    //                                       const SizedBox(
    //                                         height: 15.0,
    //                                       ),
    //                                       DefaultFormFeild(
    //                                         controller: TimeController2,
    //                                         type: TextInputType.datetime,
    //                                         label: '2nd time',
    //                                         prefix: Icons.watch_later_outlined,
    //                                         validate: (String? value) {
    //                                           if (value!.isEmpty) {
    //                                             return 'time must not be empty';
    //                                           }
    //                                           return null;
    //                                         },
    //                                         onTap: () {
    //                                           showTimePicker(
    //                                             context: context,
    //                                             initialTime: TimeOfDay.now(),
    //                                           ).then((value) {
    //                                             TimeController2.text = value!
    //                                                 .format(context)
    //                                                 .toString();
    //                                             print(value.format(context));
    //                                           });
    //                                         },
    //                                       ),
    //                                     ]))));
    //                   }
    //                   else {
    //                     scaffoldKey.currentState?.showBottomSheet((context) =>
    //                         Container(
    //                           padding: const EdgeInsets.all(15.0),
    //                             child: Form(
    //                                 key: formKey,
    //                                 child: Column(
    //                                     mainAxisSize: MainAxisSize.min,
    //                                     crossAxisAlignment: CrossAxisAlignment.end,
    //                                     children: [
    //                                       TextButton(
    //                                         child: Text(
    //                                           'Done',
    //                                           style: TextStyle(
    //                                               color: DarkBlueColor,
    //                                               fontSize: 24.0
    //                                           ),
    //                                         ),
    //                                         onPressed: (){
    //                                           Navigator.pop(context);
    //                                         },
    //                                       ),
    //                                       const SizedBox(
    //                                         height: 15.0,
    //                                       ),
    //                                       DefaultFormFeild(
    //                                         controller: TimeController1,
    //                                         type: TextInputType.datetime,
    //                                         label: '1st time',
    //                                         prefix: Icons.watch_later_outlined,
    //                                         validate: (String? value) {
    //                                           if (value!.isEmpty) {
    //                                             return 'time must not be empty';
    //                                           }
    //                                           return null;
    //                                         },
    //                                         onTap: () {
    //                                           showTimePicker(
    //                                             context: context,
    //                                             initialTime: TimeOfDay.now(),
    //                                           ).then((value) {
    //                                             TimeController1.text = value!
    //                                                 .format(context)
    //                                                 .toString();
    //                                             print(value.format(context));
    //                                           });
    //                                         },
    //                                       ),
    //                                     ]))));
    //                   }
    //                 }),
    //               ),
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 20.0,
    //           ),
    //           Center(
    //             child: Container(
    //               height: 50.0,
    //               width: 150.0,
    //               decoration: BoxDecoration(
    //                   color: TealColor,
    //                   borderRadius: BorderRadius.circular(8.0)),
    //               clipBehavior: Clip.antiAliasWithSaveLayer,
    //               child: MaterialButton(
    //                 onPressed: () {
    //                   // navigator(context, ScanScreenResult());
    //                 },
    //                 child: const Text(
    //                   'Add',
    //                   style: TextStyle(color: Colors.white, fontSize: 20.0),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ]),
    // );
  }
  // BlocProvider(
  // create: (BuildContext context)=>AppCubit()..createDB(),
  // child: BlocConsumer<AppCubit,AppStates>(
  // builder: (BuildContext context , AppStates state) {
  // AppCubit cubit = AppCubit.get(context);
  // return Scaffold(
  // key: scaffoldKey,
  // appBar: AppBar(
  // title: Text(
  // cubit.titles[cubit.currentIndex],
  // ),
  // backgroundColor: Colors.teal,
  // ),
  // floatingActionButton: FloatingActionButton(
  // onPressed: () {
  // if (cubit.isBottomSheetShown) {
  // if (formKey.currentState!.validate()) {
  // cubit.insertToDb(
  // title: titleController.text,
  // time: timeController.text,
  // date: dateController.text
  // );
  // }
  // }
  // else {
  // scaffoldKey.currentState?.showBottomSheet((context) =>
  // Container
  // (
  // child: Form(
  // key: formKey,
  // child: Column(
  // mainAxisSize: MainAxisSize.min,
  // children: [
  // DefaultFormFeild(
  // controller: titleController,
  // type: TextInputType.text,
  // label: 'Task title',
  // prefix: Icons.title,
  // validate: (String? value) {
  // if (value!.isEmpty) {
  // return 'title must not be empty';
  // }
  // return null;
  // }
  // ),
  // const SizedBox(
  // height: 15.0,
  // ),
  // DefaultFormFeild(
  // controller: timeController,
  // type: TextInputType.datetime,
  // label: 'Task time',
  // prefix: Icons.watch_later_outlined,
  // validate: (String? value) {
  // if (value!.isEmpty) {
  // return 'time must not be empty';
  // }
  // return null;
  // },
  // onTap: () {
  // showTimePicker(
  // context: context,
  // initialTime: TimeOfDay.now(),
  // ).then((value) {
  // timeController.text =
  // value!.format(context).toString();
  // print(value.format(context));
  // });
  // },
  // ),
  // const SizedBox(
  // height: 15.0,
  // ),
  // DefaultFormFeild(
  // controller: dateController,
  // type: TextInputType.datetime,
  // label: 'Task date',
  // prefix: Icons.calendar_today_outlined,
  // validate: (String? value) {
  // if (value!.isEmpty) {
  // return 'date must not be empty';
  // }
  // return null;
  // },
  // onTap: () {
  // showDatePicker(
  // context: context,
  // initialDate: DateTime.now(),
  // firstDate: DateTime.now(),
  // lastDate: DateTime.parse('2022-05-03'),
  // ).then((value) {
  // dateController.text =
  // DateFormat.yMMMd().format(value!);
  // });
  // }
  // ),
  // ],
  // ),
  // ),
  // )).closed.then((value) {
  // cubit.ChangeBottomSheetState(isShow: false, icon: Icons.edit);
  // });
  // cubit.ChangeBottomSheetState(isShow: true, icon: Icons.add);
  // }
  // },
  // child: Icon(cubit.FABIcon),
  // ),
  // bottomNavigationBar: BottomNavigationBar(
  // type: BottomNavigationBarType.fixed,
  // currentIndex: cubit.currentIndex,
  // onTap: (index) {
  // cubit.ChangeIndex(index);
  // },
  // items:
  // const [
  // BottomNavigationBarItem(
  // icon: Icon(Icons.menu),
  // label: 'Tasks',
  // ),
  // BottomNavigationBarItem(
  // icon: Icon(Icons.check_circle_outline),
  // label: 'Done',
  // ),
  // BottomNavigationBarItem(
  // icon: Icon(Icons.archive_outlined),
  // label: 'Archived',
  // ),
  // ],
  // ),
  // body: cubit.screens[cubit.currentIndex],
  // );
  // },
  // listener: (BuildContext context , AppStates state) {
  // if(state is AppInsertToDB)
  // Navigator.pop(context);
  // },
  // ),
  // );
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 20.0, color: Colors.grey[700]),
        ),
      );
}
