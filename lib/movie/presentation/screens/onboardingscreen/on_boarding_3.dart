import 'package:flutter/material.dart';
import 'package:moviesapp/movie/presentation/screens/login/login_screen.dart';
import 'package:moviesapp/movie/presentation/screens/movies_screen.dart';

class ThirdOnBoardingScreen extends StatelessWidget {
  const ThirdOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: const Text(
              'skip',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.orange[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsetsDirectional.only(start: 130, top: 80),
                    child: const Text(
                      'Conclusion',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    )),
              ],
            ),
            SizedBox(height: 30,),
            Image(image:NetworkImage('https://cdn.theatlantic.com/thumbor/DHTYdmX4d5nM2fT44AOaXNng-zE=/0x0:1920x1080/960x540/media/img/mt/2023/09/TIFF_/original.gif') ),
            SizedBox(height: 30,),

            Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Thank you for installing this appliacation, can you rate it!',style: TextStyle(color: Colors.black),),
                )),

              ],
            ),


          ],


        ),
      ),

    );



  }
}
