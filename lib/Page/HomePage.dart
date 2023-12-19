import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cannabis/Page/HomeLogin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2000),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeLogin()),
      //   nó lỗi là do chỉ gọi được api trên web thôi
        // thôi dùng tạm rứa đc mà chừ thêm ảnh kiểu chi mấy ảo k copy link đc
      //   là sao hè
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('lib/assets/logo.png'),
      ),
    );
  }
}
