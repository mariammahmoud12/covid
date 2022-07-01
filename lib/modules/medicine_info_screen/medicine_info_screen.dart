import 'package:covid19/modules/medicine_reminder_screen/cubit/reminder_cubit.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../update_medicine_info/update_medicine_info.dart';

class MedicineInfoScreen extends StatelessWidget {

   final int index ;
   MedicineInfoScreen({
     required this.index,
   });

   var id = 0 ;

   @override
  Widget build(BuildContext context) {
    id = ReminderCubit.get(context).medicines[index]['id'];
    print('the id is : $id');
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Medication',
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
          actions: [
            TextButton(
              onPressed: (){
                navigator(context, UpdateMedicineScreen());
              },
              child: Text('Edit'),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
          const Image(
            image: AssetImage(
              'assets/icons/back.png',
            ),
          ),
              Padding(
                  padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${ReminderCubit.get(context).medicines[index]['name']}',
                      style: TextStyle(
                        color: DarkBlueColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 24.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '${ReminderCubit.get(context).medicines[index]['timesAday']}',
                      style: TextStyle(
                        color: DarkBlueColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 24.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '${ReminderCubit.get(context).medicines[index]['time1']}',
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '${ReminderCubit.get(context).medicines[index]['time2']}',
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '${ReminderCubit.get(context).medicines[index]['time3']}',
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Reminder',
                      style: TextStyle(
                        color: DarkBlueColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
        ]
        ),
    );
  }
}
