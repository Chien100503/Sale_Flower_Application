import 'package:cannabis/Page_Profile/InviteFriend.dart';
import 'package:cannabis/Page_Profile/your_profile.dart';
import 'package:flutter/material.dart';

import '../Page_Profile/PaymentMethods.dart';
import '../Page_Profile/PrivacyPolicy.dart';
import '../Page_Profile/Setting.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff81AA66),
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            ClipOval(
                                child: Image.asset('lib/assets/faceavt.jpg',
                                  width: 110,
                                  height: 110,
                                  fit: BoxFit.cover,)),
                            Positioned(
                                top: 70,
                                left: 70,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff81AA66),
                                    child: Icon(Icons.create_outlined, color: Colors.white,))),
                          ],
                        ),
                        Text('Esther Howard')
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xffd0d0d9),
                              width: 2.0
                          )
                      )
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => YourProfile(),));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.person_outlined,size: 40, color: Color(
                                0xff7b7b80),),
                          ),
                          Expanded(child: Text('Your profile',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500))),
                          Icon(Icons.arrow_forward_ios),

                        ],

                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xffd0d0d9),
                              width: 2.0
                          )
                      )
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethod(),));                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.payment,size: 40, color: Color(
                                0xff7b7b80),),
                          ),
                          Expanded(child: Text('Payment methods',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500))),
                          Icon(Icons.arrow_forward_ios),

                        ],

                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xffd0d0d9),
                              width: 2.0
                          )
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(Icons.list_alt,size: 40, color: Color(
                              0xff7b7b80),),
                        ),
                        Expanded(child: Text('My orders',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w500))),
                        Icon(Icons.arrow_forward_ios),

                      ],

                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xffd0d0d9),
                              width: 2.0
                          )
                      )
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Setting(),));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.settings,size: 40, color: Color(
                                0xff7b7b80),),
                          ),
                          Expanded(child: Text('Setttings',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500))),
                          Icon(Icons.arrow_forward_ios),

                        ],

                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xffd0d0d9),
                              width: 2.0
                          )
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(Icons.help_outline,size: 40, color: Color(
                              0xff7b7b80),),
                        ),
                        Expanded(child: Text('Help Center',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w500))),
                        Icon(Icons.arrow_forward_ios),

                      ],

                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xffd0d0d9),
                              width: 2.0
                          )
                      )
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Privacy(),));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.lock_outline,size: 40, color: Color(
                                0xff7b7b80),),
                          ),
                          Expanded(child: Text('Privacy policy',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500))),
                          Icon(Icons.arrow_forward_ios),

                        ],

                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xffd0d0d9),
                              width: 2.0
                          )
                      )
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InviteFriend(),));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.person_add_outlined,size: 40, color: Color(
                                0xff7b7b80),),
                          ),
                          Expanded(child: Text('Invites Friends ',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500))),
                          Icon(Icons.arrow_forward_ios),

                        ],

                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xffd0d0d9),
                              width: 2.0
                          )
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(Icons.logout_outlined,size: 40, color: Color(
                              0xff7b7b80),),
                        ),
                        Expanded(child: Text('Log out',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w500))),
                        Icon(Icons.arrow_forward_ios),

                      ],

                    ),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xffF5AB29),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        }, items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.local_mall), label: 'Store'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.comment), label: 'Comment'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        // BottomNavigationBarItem(icon: Icon(Icons.home)),
      ],
      ),
    );
  }
}
