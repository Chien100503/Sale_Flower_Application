import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220),
        child: SizedBox(
          height: 200,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.symmetric(vertical: 45, horizontal: 15),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage('lib/assets/bgp.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: const Align(
                            alignment: Alignment.topLeft,
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            )),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 250,),
                      InkWell(
                        child: const Align(
                            alignment: Alignment.topLeft,
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                            )),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 30,),
                      InkWell(
                        child: const Align(
                            alignment: Alignment.topLeft,
                            child: Icon(
                              Icons.settings,
                              color: Colors.white,
                            )),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70, left: 100),
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('lib/assets/faceavt.jpg'),
                      radius: 35,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
