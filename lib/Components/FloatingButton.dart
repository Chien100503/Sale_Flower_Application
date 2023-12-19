import 'package:cannabis/Db/Config.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:draggable_fab/draggable_fab.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonAdd extends StatefulWidget {
  final token;
  const ButtonAdd({@required this.token, Key? key}) : super(key: key);
  @override
  _ButtonAddState createState() => _ButtonAddState();
}

class _ButtonAddState extends State<ButtonAdd> {
  late TextEditingController _title;
  late TextEditingController _description;
  late TextEditingController _image;
  late TextEditingController _price;
  late String? userId;
  @override
  void initState() {
    super.initState();
    _title = TextEditingController();
    _description = TextEditingController();
    _image = TextEditingController();
    _price = TextEditingController();
  }

  void addProducts() async {
    SharedPreferences local = await SharedPreferences.getInstance();
    setState(() {
      userId = local.getString('userId');
    });
    if (userId != null &&
        _title.text.isNotEmpty &&
        _description.text.isNotEmpty &&
        _image.text.isNotEmpty &&
        _price.text.isNotEmpty) {
      var regBody = {
        "UserId": local.getString('userId'),
        "title": _title.text,
        "description": _description.text,
        "image": _image.text,
        "price": _price.text,
      };
      var response = await http.post(
        Uri.parse(addProduct),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] != null && jsonResponse['status']) {
        _title.clear();
        _description.clear();
        _image.clear();
        _price.clear();
        Navigator.pop(context);
      } else {
        print('something went wrong $jsonResponse');
      }
    }
  }

// cái hàm chưa được gọi mà
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('AddProduct'),
          content: Container(
            height: 300,
            width: 400,
            child: Column(
              children: [
                TextField(
                  controller: _title,
                  decoration: InputDecoration(
                      hintText: 'Title Product',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff81AA66)),
                          borderRadius: BorderRadius.circular(10))),
                  onChanged: (value) {
                    // Xử lý khi thay đổi giá trị nhập vào
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _description,
                  decoration: InputDecoration(
                      hintText: 'Description...',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff81AA66)),
                          borderRadius: BorderRadius.circular(10))),
                  onChanged: (value) {
                    // Xử lý khi thay đổi giá trị nhập vào
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _image,
                  decoration: InputDecoration(
                      hintText: 'Link image...',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff81AA66)),
                          borderRadius: BorderRadius.circular(10))),
                  onChanged: (value) {
                    // Xử lý khi thay đổi giá trị nhập vào
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _price,
                  decoration: InputDecoration(
                      hintText: 'Price...',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff81AA66)),
                          borderRadius: BorderRadius.circular(10))),
                  onChanged: (value) {
                    // Xử lý khi thay đổi giá trị nhập vào
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                addProducts();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: DraggableFab(
      child: FloatingActionButton(
        onPressed: () {
          _displayTextInputDialog(context);
        },
        backgroundColor: Color(0xff81AA66),
        child: Icon(Icons.add),
      ),
    ));
  }
}
