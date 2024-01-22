import 'package:flutter/material.dart';

class InviteFriend extends StatefulWidget {
  const InviteFriend({super.key});

  @override
  State<InviteFriend> createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const CircleAvatar(child: Icon(Icons.arrow_back)),
        ),
        title: const Text(
          'Invite Friends',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xffd0d0d9), width: 2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                            child: Image.asset(
                          'lib/assets/faceavt.jpg',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )),
                        const Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      'Carla Shoe',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("192.102.1.1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(85, 30),
                                onPrimary: Colors.white,
                                primary: Colors.brown),
                            child: const Text(
                              'Invite',
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Color(0xffd0d0d9), width: 2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )),
                        const Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      'Carla Shoe',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("192.102.1.1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(85, 30),
                                onPrimary: Colors.white,
                                primary: Colors.brown),
                            child: const Text(
                              'Invite',
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Color(0xffd0d0d9), width: 2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )),
                        const Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      'Carla Shoe',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("192.102.1.1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(85, 30),
                                onPrimary: Colors.white,
                                primary: Colors.brown),
                            child: const Text(
                              'Invite',
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Color(0xffd0d0d9), width: 2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )),
                        const Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      'Carla Shoe',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("192.102.1.1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(85, 30),
                                onPrimary: Colors.white,
                                primary: Colors.brown),
                            child: const Text(
                              'Invite',
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Color(0xffd0d0d9), width: 2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,  bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )),
                        const Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10,),
                                child: Column(
                                  children: [
                                    Text(
                                      'Carla Shoe',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("192.102.1.1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(85, 30),
                                onPrimary: Colors.white,
                                primary: Colors.brown),
                            child: const Text(
                              'Invite',
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Color(0xffd0d0d9), width: 2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,  bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )),
                        const Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10,),
                                child: Column(
                                  children: [
                                    Text(
                                      'Carla Shoe',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("192.102.1.1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(85, 30),
                                onPrimary: Colors.white,
                                primary: Colors.brown),
                            child: const Text(
                              'Invite',
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Color(0xffd0d0d9), width: 2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,  bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )),
                        const Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10,),
                                child: Column(
                                  children: [
                                    Text(
                                      'Carla Shoe',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("192.102.1.1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(85, 30),
                                onPrimary: Colors.white,
                                primary: Colors.brown),
                            child: const Text(
                              'Invite',
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Color(0xffd0d0d9), width: 2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,  bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )),
                        const Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10,),
                                child: Column(
                                  children: [
                                    Text(
                                      'Carla Shoe',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("192.102.1.1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(85, 30),
                                onPrimary: Colors.white,
                                primary: Colors.brown),
                            child: const Text(
                              'Invite',
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Color(0xffd0d0d9), width: 2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,  bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )),
                        const Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10,),
                                child: Column(
                                  children: [
                                    Text(
                                      'Carla Shoe',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("192.102.1.1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(85, 30),
                                onPrimary: Colors.white,
                                primary: Colors.brown),
                            child: const Text(
                              'Invite',
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Color(0xffd0d0d9), width: 2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,  bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )),
                        const Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10,),
                                child: Column(
                                  children: [
                                    Text(
                                      'Carla Shoe',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("192.102.1.1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(85, 30),
                                onPrimary: Colors.white,
                                primary: Colors.brown),
                            child: const Text(
                              'Invite',
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Color(0xffd0d0d9), width: 2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,  bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )),
                        const Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10,),
                                child: Column(
                                  children: [
                                    Text(
                                      'Carla Shoe',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("192.102.1.1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(85, 30),
                                onPrimary: Colors.white,
                                primary: Colors.brown),
                            child: const Text(
                              'Invite',
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Color(0xffd0d0d9), width: 2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,  bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )),
                        const Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10,),
                                child: Column(
                                  children: [
                                    Text(
                                      'Carla Shoe',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("192.102.1.1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(85, 30),
                                onPrimary: Colors.white,
                                primary: Colors.brown),
                            child: const Text(
                              'Invite',
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Color(0xffd0d0d9), width: 2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,  bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )),
                        const Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10,),
                                child: Column(
                                  children: [
                                    Text(
                                      'Carla Shoe',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("192.102.1.1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(85, 30),
                                onPrimary: Colors.white,
                                primary: Colors.brown),
                            child: const Text(
                              'Invite',
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Color(0xffd0d0d9), width: 2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,  bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )),
                        const Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10,),
                                child: Column(
                                  children: [
                                    Text(
                                      'Carla Shoe',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("192.102.1.1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(85, 30),
                                onPrimary: Colors.white,
                                primary: Colors.brown),
                            child: const Text(
                              'Invite',
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
