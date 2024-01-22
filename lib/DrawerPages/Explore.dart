import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60,  left: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    Container(
                      height: 349,
                      width: 317,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assets/explore1.png'),
                            fit: BoxFit.fill),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Container(
                            height: 120,
                            width: 120,
                                child: Lottie.asset('lib/assets/sale.json'),
                          )),
                          const SizedBox(
                            height: 5,
                          ),
                          const Center(
                            child: Text(
                              '''50% Off
                                  Everything''',
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 34,
                                  height: 0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Center(
                            child: Text('with code: sativa 123'),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Container(
                        height: 349,
                        width: 317,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('lib/assets/explore2.png'),
                              fit: BoxFit.fill),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Container(
                              height: 56,
                              width: 47,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('lib/assets/logo1.png'),
                                      fit: BoxFit.cover)),
                            )),
                            const SizedBox(
                              height: 30,
                            ),
                            const Center(
                              child: Text(
                                '''50% Off
                                    Everything''',
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 36,
                                    height: 0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Center(
                              child: Text('with code: sativa 123'),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Top Categories',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              ),
              SizedBox(height: 8),
              Text(
                'Mark the occassion with these must have products',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w300, fontSize: 14, wordSpacing: 5),
              ),
              SizedBox(height: 19),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 85,
                          width: 84,
                          decoration: BoxDecoration(
                              color: Color(0xffeef3f7),
                              borderRadius: BorderRadius.circular(10)),
                          child: Image(
                            image: AssetImage('lib/assets/vape.png'),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('Vapes', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 85,
                          width: 84,
                          decoration: BoxDecoration(
                              color: Color(0xfffdf7ee),
                              borderRadius: BorderRadius.circular(10)),
                          child: Image(
                            image: AssetImage('lib/assets/cannabis.png'),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('Flower', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 85,
                          width: 84,
                          decoration: BoxDecoration(
                              color: Color(0xfff1f5e9),
                              borderRadius: BorderRadius.circular(10)),
                          child: Image(
                            image: AssetImage('lib/assets/cookie.png'),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('Cookie', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),)
                      ],
                    ),
                  ],
                ),
              ),
              Lottie.asset('lib/assets/tet4.json')
            ],
          ),
        ),
      ),
    );
  }
}
