import 'package:flutter/material.dart';
import 'package:moviesapp/movie/presentation/screens/login/login_screen.dart';
import 'package:moviesapp/movie/presentation/screens/movies_screen.dart';

class SecondOnBoardingScreen extends StatelessWidget {
  const SecondOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
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
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.redAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsetsDirectional.only(start:60, top: 80),
                    child: const Text(
                      'What is Movie App ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    )),
              ],
            ),
            SizedBox(height: 30,),
            Image(image:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ50OnbzO2j06VRkio_LmnDIx6a3HFan47YpvCyOWAKn1P3VhCTXdNkoRT8qesMWTt3ehI&usqp=CAU') ),
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Movie App is Application has DataBase from api has name Movie DataBase this application will help you to following recent  films '),
                )),

              ],
            ),


          ],


        ),
      ),

    );


  }
}
