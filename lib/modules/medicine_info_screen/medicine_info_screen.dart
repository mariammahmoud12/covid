import 'package:covid19/modules/add_medicine_screen/add_medicine_screen.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';

class MedicineInfoScreen extends StatelessWidget {
  const MedicineInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                navigator(context, AddMedicineScreen());
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
                        'Name of medicine',
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
                      'Times A day',
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
                      'Time 1',
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Time 2',
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Time 3',
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
