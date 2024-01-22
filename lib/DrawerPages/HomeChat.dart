import 'package:cannabis/chat/UserTwo.dart';
import 'package:cannabis/chat/userOne.dart';
import 'package:flutter/material.dart';

class HomeChat extends StatefulWidget {
  const HomeChat({super.key});

  @override
  State<HomeChat> createState() => _HomeChatState();
}

class _HomeChatState extends State<HomeChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff81AA66),
        title: Text('Chat'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 30, 16, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserOne(),
                      ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    color: Color(0xff81AA66),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      ClipOval(
                          child: Image.asset(
                        'lib/assets/faceavt.jpg',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      )),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        'Hồ Xuân Chiến',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      Icon(
                        Icons.list,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserTwo(),
                      ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    color: Color(0xff81AA66),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      ClipOval(
                          child: Image.asset(
                        'lib/assets/faceavt.jpg',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      )),
                      SizedBox(
                        width: 40,
                      ),
                      Text('Ngo Van Minh',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18)),
                      SizedBox(
                        width: 115,
                      ),
                      Icon(
                        Icons.list,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Color(0xff81AA66),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    ClipOval(
                        child: Image.asset(
                      'lib/assets/faceavt.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    )),
                    SizedBox(
                      width: 40,
                    ),
                    Text('Trịnh Đình Hùng',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18)),
                    SizedBox(
                      width: 98,
                    ),
                    Icon(
                      Icons.list,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Color(0xff81AA66),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    ClipOval(
                        child: Image.asset(
                      'lib/assets/faceavt.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    )),
                    SizedBox(
                      width: 40,
                    ),
                    Text('Trần Quang Huy',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18)),
                    SizedBox(
                      width: 99,
                    ),
                    Icon(
                      Icons.list,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Color(0xff81AA66),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    ClipOval(
                        child: Image.asset(
                      'lib/assets/faceavt.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    )),
                    SizedBox(
                      width: 40,
                    ),
                    Text('Nguyễn Tuấn Anh',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18)),
                    SizedBox(
                      width: 86,
                    ),
                    Icon(
                      Icons.list,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
