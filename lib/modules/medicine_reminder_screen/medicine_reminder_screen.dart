import 'package:covid19/modules/add_medicine_screen/add_medicine_screen.dart';
import 'package:covid19/modules/medicine_reminder_screen/cubit/reminder_cubit.dart';
import 'package:covid19/modules/medicine_reminder_screen/cubit/reminder_states.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicineReminderScreen extends StatelessWidget {
  const MedicineReminderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReminderCubit, ReminderStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Medicine Reminder',
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
            ListView.separated(
              itemBuilder: (context, index) => Dismissible(
                key: ValueKey(ReminderCubit.get(context).medicines[index]),
                background: Container(
                  color: Colors.red,
                  child: const Center(
                      child: Text(
                    'DELETE',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )),
                ),
                onDismissed: (DismissDirection direction) {
                  ReminderCubit.get(context).deleteFromDB(ReminderCubit.get(context).medicines[index]['id']);
                },
                child: BuildMedItem(
                  ReminderCubit.get(context).medicines[index],
                  context,
                  index,
                ),
              ),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(start: 20.0),
                child: Container(
                  padding: const EdgeInsetsDirectional.only(start: 20.0),
                  color: Colors.grey[300],
                  width: double.infinity,
                  height: 1.0,
                ),
              ),
              itemCount: ReminderCubit.get(context).medicines.length,
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              navigator(context, const AddMedicineScreen());
            },
            child: const Icon(Icons.add),
            backgroundColor: DarkBlueColor,
          ),
        );
      },
    );
  }
}
