import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';

class MedicineReminderScreen extends StatelessWidget {
  const MedicineReminderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              'There is no reminder',
              style: TextStyle(
                fontSize: 40.0,
                color: DarkBlueColor,
              ),
            ),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: DarkBlueColor,
      ),
    );
  }
}
