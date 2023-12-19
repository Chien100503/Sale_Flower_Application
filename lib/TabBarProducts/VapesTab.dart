import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../Components/FloatingButton.dart';
import '../Db/Config.dart';

class VapeProducts extends StatefulWidget {
  final token;

  const VapeProducts({@required this.token, Key? key}) : super(key: key);

  @override
  State<VapeProducts> createState() => _VapeProductsState();
}

class _VapeProductsState extends State<VapeProducts> {
  List? items;

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
    listStore(); // Call listStore to fetch data when the widget initializes
  }

  Future<void> addProducts() async {
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
        listStore(); // Refresh the list after adding a new product
        Navigator.pop(context);
      } else {
        print('something went wrong $jsonResponse');
      }
    }
  }

  Future<Map<String, dynamic>> listStore() async {
    var response = await http.get(Uri.parse(getProduct));
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    if (jsonResponse.containsKey('success')) {
      setState(() {
        items = jsonResponse['success'];
      });
    }
    return jsonResponse;
  }

  void deleteProduct(String id) async {
    try {
      var response = await http.delete(
        Uri.parse("$todos$id"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status']) {
          await listStore();
        } else {
          print('Deletion failed: ${jsonResponse['message']}');
        }
      } else {
        print('HTTP Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: items == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                // Disable scrolling for the inner ListView
                shrinkWrap: true,
                // Allow the ListView to be as tall as its content
                itemCount: items!.length,
                itemBuilder: (context, int index) {
                  return Slidable(
                    key: ValueKey(index),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () {}),
                      children: [
                        SlidableAction(
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                          onPressed: (BuildContext context) {
                            deleteProduct('${items![index]['_id']}');
                          },
                        ),
                      ],
                    ),
                    child: Card(
                      borderOnForeground: false,
                      child: ListTile(
                        leading: Dialog.fullscreen(
                          child: Container(
                              height: 50,
                              width: 50,
                              child: Image(
                                  image: NetworkImage(
                                      '${items![index]['image']}'))),
                        ),
                        title: Text('${items![index]['title']}'),
                        subtitle: Text('${items![index]['description']}'),
                        trailing: Text('${items![index]['price']}\$'),
                        onTap: () {
                          _showDialog(context, items![index]);
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
        width: 50,
        height: 50,
        child: const Center(
          child: ButtonAdd(
            token: null,
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 100,
            width: 100,
            child: Column(
              children: [
                Image(image: NetworkImage('${item['image']}')),
              ],
            ),
          ),
        );
      },
    );
  }
}
