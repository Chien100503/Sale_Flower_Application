import 'package:flutter/material.dart';

class UserOne extends StatefulWidget {
  const UserOne({super.key});

  @override
  State<UserOne> createState() => _UserOneState();
}

class _UserOneState extends State<UserOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff81AA66),
        title: Text('Hồ Xuân Chiến'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Today',
                          style: TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          color: Color(0xff81AA66),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                                'Loremdajfhsjhdfjhjfhsjahfhkbgfgsfghjfsxxccccccxxxxxxxxxxxxxxxxxxg', style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Hồ Xuân Chiến'),
                          SizedBox(
                            width: 100,
                          ),
                          Text('17:02')
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Color(0xff81AA66),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                  'Loremdajfhsjhdfjhjfhsjahfhkbgfgsfghjfsxxccccccxxxxxxxxxxxxxxxxxxg', style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('17:02'),
                            SizedBox(
                              width: 100,
                            ),
                            Text('Hồ Xuân Chiến'),
                            SizedBox(
                              width: 10,
                            ),
                            ClipOval(
                              child: Image.asset(
                                'lib/assets/faceavt.jpg',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          color: Color(0xff81AA66),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                                'Loremdajfhsjhdfjhjfhsjahfhkbgfgsfghjfsxxccccccxxxxxxxxxxxxxxxxxxg', style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Hồ Xuân Chiến'),
                          SizedBox(
                            width: 100,
                          ),
                          Text('17:02')
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Color(0xff81AA66),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                  'Loremdajfhsjhdfjhjfhsjahfhkbgfgsfghjfsxxccccccxxxxxxxxxxxxxxxxxxg', style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('17:02'),
                            SizedBox(
                              width: 100,
                            ),
                            Text('Hồ Xuân Chiến'),
                            SizedBox(
                              width: 10,
                            ),
                            ClipOval(
                              child: Image.asset(
                                'lib/assets/faceavt.jpg',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          color: Color(0xff81AA66),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                                'Loremdajfhsjhdfjhjfhsjahfhkbgfgsfghjfsxxccccccxxxxxxxxxxxxxxxxxxg', style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'lib/assets/faceavt.jpg',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Hồ Xuân Chiến'),
                          SizedBox(
                            width: 100,
                          ),
                          Text('17:02')
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Color(0xff81AA66),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                  'Loremdajfhsjhdfjhjfhsjahfhkbgfgsfghjfsxxccccccxxxxxxxxxxxxxxxxxxg', style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('17:02'),
                            SizedBox(
                              width: 100,
                            ),
                            Text('Hồ Xuân Chiến'),
                            SizedBox(
                              width: 10,
                            ),
                            ClipOval(
                              child: Image.asset(
                                'lib/assets/faceavt.jpg',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Type your message...',
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          // Xử lý khi người dùng nhấn nút gửi
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
