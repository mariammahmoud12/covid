import 'package:covid19/modules/medicine_info_screen/medicine_info_screen.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          child: Text('User Profile'),
      onPressed: (){
            navigator(context, MedicineInfoScreen());
      }
        ,),
    );
  }
}
