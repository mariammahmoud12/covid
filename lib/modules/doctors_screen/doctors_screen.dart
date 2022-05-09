import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';
import '../doctor_info_screen/doctor_info_screen.dart';


class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
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
                      Icon(Icons.search , color: DarkBlueColor),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: DarkBlueColor
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Doctor1.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Dr/ Mohamed Belal',
                                style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0,),
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
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star , color: GoldColor,),
                                        // Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star_border_outlined , color: GoldColor,),
                                        //Icon(Icons.star_border_outlined , color: GoldColor,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, DoctorInfoScreen());
                        },
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Doctor1.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Dr/ Mohamed Belal',
                                style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0,),
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
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star , color: GoldColor,),
                                        // Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star_border_outlined , color: GoldColor,),
                                        //Icon(Icons.star_border_outlined , color: GoldColor,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, DoctorInfoScreen());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Doctor1.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Dr/ Mohamed Belal',
                                style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0,),
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
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star , color: GoldColor,),
                                        // Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star_border_outlined , color: GoldColor,),
                                        //Icon(Icons.star_border_outlined , color: GoldColor,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, DoctorInfoScreen());
                        },
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Doctor1.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Dr/ Mohamed Belal',
                                style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0,),
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
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star , color: GoldColor,),
                                        // Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star_border_outlined , color: GoldColor,),
                                        //Icon(Icons.star_border_outlined , color: GoldColor,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, DoctorInfoScreen());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Doctor1.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Dr/ Mohamed Belal',
                                style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0,),
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
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star , color: GoldColor,),
                                        // Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star_border_outlined , color: GoldColor,),
                                        //Icon(Icons.star_border_outlined , color: GoldColor,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, DoctorInfoScreen());
                        },
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Doctor1.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Dr/ Mohamed Belal',
                                style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0,),
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
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star , color: GoldColor,),
                                        // Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star_border_outlined , color: GoldColor,),
                                        //Icon(Icons.star_border_outlined , color: GoldColor,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, DoctorInfoScreen());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Doctor1.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Dr/ Mohamed Belal',
                                style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0,),
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
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star , color: GoldColor,),
                                        // Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star_border_outlined , color: GoldColor,),
                                        //Icon(Icons.star_border_outlined , color: GoldColor,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, DoctorInfoScreen());
                        },
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Doctor1.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Dr/ Mohamed Belal',
                                style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0,),
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
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star , color: GoldColor,),
                                        // Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star_border_outlined , color: GoldColor,),
                                        //Icon(Icons.star_border_outlined , color: GoldColor,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, DoctorInfoScreen());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Doctor1.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Dr/ Mohamed Belal',
                                style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0,),
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
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star , color: GoldColor,),
                                        // Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star_border_outlined , color: GoldColor,),
                                        //Icon(Icons.star_border_outlined , color: GoldColor,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, DoctorInfoScreen());
                        },
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/Doctor1.png'),
                                width: double.infinity,
                              ),
                              Text(
                                'Dr/ Mohamed Belal',
                                style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0,),
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
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star , color: GoldColor,),
                                        // Icon(Icons.star , color: GoldColor,),
                                        Icon(Icons.star_border_outlined , color: GoldColor,),
                                        //Icon(Icons.star_border_outlined , color: GoldColor,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'Cairo, Egypt',
                                style: TextStyle(
                                  color: LightGreyColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color:  Color(0x1f59d0d0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        onTap: (){
                          navigator(context, DoctorInfoScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
