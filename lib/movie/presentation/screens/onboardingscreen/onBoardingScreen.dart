import 'package:flutter/material.dart';
import 'package:moviesapp/movie/presentation/screens/login/login_screen.dart';
import 'package:moviesapp/movie/presentation/screens/movies_screen.dart';
import 'package:moviesapp/movie/presentation/screens/onboardingscreen/on_boarding_1.dart';
import 'package:moviesapp/movie/presentation/screens/onboardingscreen/on_boarding_2.dart';
import 'package:moviesapp/movie/presentation/screens/onboardingscreen/on_boarding_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: const [
            FirstOnBoardingScreen(),
            SecondOnBoardingScreen(),
            ThirdOnBoardingScreen(),
          ],
        ),
        Container(
            alignment: const Alignment(0, .75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                     TextButton(
                      onPressed: (){
                        _controller.previousPage(
                            duration: Duration(microseconds: 400),
                            curve: Curves.easeIn);
                      },
                   child: Text(
                      'Previous',
                      style: TextStyle(color: Colors.white,),
                    )),
                SmoothPageIndicator(controller: _controller, count: 3),
                onLastPage
                    ? TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                    },
                    child: Text(
                      'Done',
                      style: TextStyle(color: Colors.white,),
                    ))
                    :  TextButton(
                    onPressed: (){
                      _controller.nextPage(
                          duration: Duration(microseconds: 400),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white,),
                    )),
              ],
            )),
      ]),
    );
  }
}
