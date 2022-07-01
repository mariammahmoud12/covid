import 'package:covid19/modules/scan_result_screen/scan_result_screen.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';

class SymptomsScreen extends StatefulWidget {
  const SymptomsScreen({Key? key}) : super(key: key);

  @override
  State<SymptomsScreen> createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Text(
          'Symptoms',
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
        actions: const [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/icons/girl.jpg'),
              radius: 22.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Check on your ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Symptoms ',
                    style: TextStyle(
                      color: DarkBlueColor,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    'to get ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Result',
                    style: TextStyle(
                      color: DarkBlueColor,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isCheck ? Icons.check_circle : Icons.check_circle_outline,
                      size: 40.0,
                      color: DarkBlueColor,
                    ),
                    onPressed: ()
                    {
                      setState(() {
                        isCheck = !isCheck;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Cough',
                    style: TextStyle(
                      color: DarkBlueColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                color: Colors.grey[200],
                height: 1,
                width: double.infinity,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isCheck ? Icons.check_circle : Icons.check_circle_outline,
                      size: 40.0,
                      color: DarkBlueColor,
                    ),
                    onPressed: ()
                    {
                      setState(() {
                        isCheck = !isCheck;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Shortness of breath',
                    style: TextStyle(
                      color: DarkBlueColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                color: Colors.grey[200],
                height: 1,
                width: double.infinity,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isCheck ? Icons.check_circle : Icons.check_circle_outline,
                      size: 40.0,
                      color: DarkBlueColor,
                    ),
                    onPressed: ()
                    {
                      setState(() {
                        isCheck = !isCheck;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Hot',
                    style: TextStyle(
                      color: DarkBlueColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                color: Colors.grey[200],
                height: 1,
                width: double.infinity,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isCheck ? Icons.check_circle : Icons.check_circle_outline,
                      size: 40.0,
                      color: DarkBlueColor,
                    ),
                    onPressed: ()
                    {
                      setState(() {
                        isCheck = !isCheck;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Cold',
                    style: TextStyle(
                      color: DarkBlueColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                color: Colors.grey[200],
                height: 1,
                width: double.infinity,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isCheck ? Icons.check_circle : Icons.check_circle_outline,
                      size: 40.0,
                      color: DarkBlueColor,
                    ),
                    onPressed: ()
                    {
                      setState(() {
                        isCheck = !isCheck;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Cough',
                    style: TextStyle(
                      color: DarkBlueColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: TealColor,
                    borderRadius: BorderRadius.circular(6.0)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: MaterialButton(
                  onPressed: () {
                    // if (FormKey.currentState!.validate()) {
                    //   if(type.toString() == 'Doctor')
                        navigator(context, ScanScreenResult());
                    // }
                  },
                  child: const Text(
                    'Result',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
