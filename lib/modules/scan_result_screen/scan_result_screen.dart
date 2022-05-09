import 'package:covid19/layouts/home_layout/home_layout.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:flutter/material.dart';

class ScanScreenResult extends StatelessWidget {
  const ScanScreenResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Text(
          'Result',
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
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical:40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      'The Result is :',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 30.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                      'Positive',
                    style: TextStyle(
                      color: DarkBlueColor,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 50.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        color: TealColor,
                        borderRadius: BorderRadius.circular(6.0)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: MaterialButton(
                      onPressed: () {
                        //   if (FormKey.currentState!.validate()) {
                        navigator(context, HomeLayout());
                        //   }
                      },
                      child: const Text(
                        'Go To Home',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x1f59d0d0),
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                height: 75.0,
                alignment: AlignmentDirectional.bottomCenter,
                child: Image(
                  image: AssetImage(
                    'assets/icons/Component2.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
