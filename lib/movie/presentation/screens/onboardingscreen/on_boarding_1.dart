import 'package:flutter/material.dart';
import 'package:moviesapp/movie/presentation/screens/login/login_screen.dart';
import 'package:moviesapp/movie/presentation/screens/movies_screen.dart';

class FirstOnBoardingScreen extends StatelessWidget {
  const FirstOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  LoginScreen()));
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
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsetsDirectional.only(start: 15, top: 80),
                    child: const Text(
                      'Welcome to our Movie App!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    )),
              ],
            ),
            SizedBox(height: 30,),
            Image(image:NetworkImage('https://cdn.pixabay.com/photo/2019/04/24/21/55/cinema-4153289_1280.jpg') ),
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Our Movie App is your ultimate destination for all things related to movies, from browsing through an extensive catalog to discovering new releases, accessing detailed information about your favorite films',style: TextStyle(color: Colors.white),),
                )),

              ],
            ),


          ],


        ),
      ),

    );
  }
}
