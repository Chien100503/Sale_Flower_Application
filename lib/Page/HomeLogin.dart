import 'package:cannabis/Page/Join.dart';
import 'package:cannabis/Page/Login.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

class HomeLogin extends StatefulWidget {
  HomeLogin({super.key});

  @override
  State<HomeLogin> createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  bool sizeBool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/assets/brg.png'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 50,
            left: 80,
            child: Column(
              children: [
                Image(
                  image: AssetImage('lib/assets/logo.png'),
                  width: 80,
                  height: 80,
                  color: Colors.white,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    Text(
                      'Stay High.',
                      style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontFamily: 'Gilroy'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Stay Happy.',
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Always.',
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Container(
                        height: 52,
                        width: 125,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text('Join',
                              style: TextStyle(
                                  color: Color(0xff81AA66),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18)),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: Join(),
                                type: PageTransitionType.rightToLeftWithFade));
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: Container(
                        height: 52,
                        width: 125,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Log in',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: Login(),
                                type: PageTransitionType.rightToLeftWithFade));
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage('lib/assets/logoG.png')),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Continue with google',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
