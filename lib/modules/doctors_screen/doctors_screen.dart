import 'package:covid19/models/doctor_model.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:covid19/shared/cubit/app_cubit.dart';
import 'package:covid19/shared/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../doctor_info_screen/doctor_info_screen.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1.0,
            title: Text(
              'Doctors',
              style: TextStyle(
                color: DarkBlueColor,
                fontSize: 27.0,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: DarkBlueColor,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/icons/girl.jpg'),
                  radius: 22.0,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey[100],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: DarkBlueColor),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(fontSize: 20.0, color: DarkBlueColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  if (AppCubit.get(context).doctors != null && AppCubit.get(context).doctors!.isNotEmpty)
                    Expanded(
                      child: GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        shrinkWrap: true,
                        children: List.generate(
                          AppCubit.get(context).doctors!.length,
                          (index) => buildDoctorItem(AppCubit.get(context).doctors![index], context),
                        ),
                      ),
                    ),
                  if (AppCubit.get(context).doctors != null && AppCubit.get(context).doctors!.isEmpty)
                    const Expanded(
                      child: Center(
                        child: Text('No Doctors Found'),
                      ),
                    ),
                  if (AppCubit.get(context).doctors == null)
                    const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildDoctorItem(DoctorModel doctor, context) {
    return InkWell(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/icons/Doctor1.png'),
              width: double.infinity,
              height: 130,
            ),
            Text(
              'Dr/ ${doctor.name}',
              style: TextStyle(
                color: DarkBlueColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Text(
                  'Specialist',
                  style: TextStyle(
                    color: LightGreyColor,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Cairo, Egypt',
              style: TextStyle(
                color: LightGreyColor,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        padding: EdgeInsets.all(10.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Color(0x1f59d0d0),
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      onTap: () {
        navigator(context, DoctorInfoScreen(doctor: doctor,));
      },
    );
  }
}
