import 'package:cannabis/Page/Home.dart';
import 'package:cannabis/Page/HomeLogin.dart';
import 'package:cannabis/Page/HomePage.dart';
import 'package:cannabis/intro_pages/Intro_page1.dart';
import 'package:cannabis/intro_pages/Intro_page2.dart';
import 'package:cannabis/intro_pages/Intro_page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          controller: _controller,
          children: [IntroOne(), IntroTwo(), IntroThree()],
        ),
        Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Text('Skip'),
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                ),
                SmoothPageIndicator(
                    controller:_controller, count: 3, effect: WormEffect()),
                onLastPage ?
                GestureDetector(
                  child: Text('Start'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return HomeLogin();
                    }));
                  },
                ) : GestureDetector(
                  child: Text('Next'),
                  onTap: () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                ),
              ],
            )),
      ],
    ));
  }
}
