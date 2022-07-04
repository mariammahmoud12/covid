import 'package:covid19/models/doctor_model.dart';
import 'package:covid19/modules/messenger_screen/chat_details_screen.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';

class DoctorInfoScreen extends StatefulWidget {
  const DoctorInfoScreen({Key? key, required this.doctor}) : super(key: key);

  final DoctorModel doctor;

  @override
  State<DoctorInfoScreen> createState() => _DoctorInfoScreenState();
}

class _DoctorInfoScreenState extends State<DoctorInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Text(
          'About Doctor',
          style: TextStyle(
            color: DarkBlueColor,
            fontSize: 25.0,
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
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Icon(Icons.message_outlined , size: 35.0, color: DarkBlueColor,),
        //   )
        // ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage('assets/icons/Doctor1.png'),
              ),
              Text(
                'Dr/ ${widget.doctor.name}',
                style: TextStyle(fontSize: 30.0, color: DarkBlueColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                'Cairo , Egypt',
                style: TextStyle(
                  fontSize: 25.0,
                  color: LightGreyColor,
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                'Specialist',
                style: TextStyle(
                  color: LightGreyColor,
                  fontSize: 22.0,
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      decoration:
                          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.0), border: Border.all(color: Colors.grey)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: MaterialButton(
                        onPressed: () {
                          navigator(
                              context,
                              ChatDetailsScreen(
                                model: widget.doctor,
                              ));
                        },
                        child: const Text(
                          'Message',
                          style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Review',
                      style: TextStyle(color: DarkBlueColor, fontSize: 22.0),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'See more',
                          style: TextStyle(color: Colors.grey, fontSize: 20.0),
                        ),
                      ),
                      alignment: Alignment.topRight,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/icons/girl.jpg'),
                    radius: 25.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Mariam Mahmoud',
                                style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  // Icon(Icons.star_border_outlined , color: GoldColor,),
                                  Icon(
                                    Icons.star_border_outlined,
                                    color: GoldColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey, fontSize: 20.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/icons/girl.jpg'),
                    radius: 25.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Mariam Mahmoud',
                                style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  // Icon(Icons.star_border_outlined , color: GoldColor,),
                                  Icon(
                                    Icons.star_border_outlined,
                                    color: GoldColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey, fontSize: 20.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/icons/girl.jpg'),
                    radius: 25.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Mariam Mahmoud',
                                style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  // Icon(Icons.star_border_outlined , color: GoldColor,),
                                  Icon(
                                    Icons.star_border_outlined,
                                    color: GoldColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey, fontSize: 20.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/icons/girl.jpg'),
                    radius: 25.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Mariam Mahmoud',
                                style: TextStyle(
                                  color: DarkBlueColor,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: GoldColor,
                                  ),
                                  // Icon(Icons.star_border_outlined , color: GoldColor,),
                                  Icon(
                                    Icons.star_border_outlined,
                                    color: GoldColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey, fontSize: 20.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300],
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
