import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';

class HospitalInfoScreen extends StatelessWidget {
  const HospitalInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Text(
          'Hospital info',
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
          CircleAvatar(
            backgroundImage: AssetImage('assets/icons/girl.jpg'),
            radius: 22.0,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
       // physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
                child: Image(
                  image: AssetImage('assets/icons/hospital1.png'),
                  height: 200.0,
                  width: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: Color(0x1f59d0d0),
                )
            ),
            Container(
              color: Colors.grey,
              width: double.infinity,
              height: 2 ,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                //scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hospital name',
                      style: TextStyle(
                          fontSize: 40.0,
                          color: DarkBlueColor,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 6.0,),
                    Text(
                      'Cairo , Egypt',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: LightGreyColor,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Text(
                      'it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.it is a long established fact that a reader will be distracted the readable content.',
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
