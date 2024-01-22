import 'package:cannabis/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../Components/FloatingButton.dart';
import '../Db/Config.dart';
import '../controller/cart_controller.dart';

class ProductGoToSearch extends StatefulWidget {

  final token;

  const ProductGoToSearch({@required this.token, Key? key}) : super(key: key);

  @override
  State<ProductGoToSearch> createState() => _ProductGoToSearchState();
}

class _ProductGoToSearchState extends State<ProductGoToSearch>
    with SingleTickerProviderStateMixin {
  Future<void> _handlRefresh() async {
    await listStore();
  }
  List? items;

  late TextEditingController _title;
  late TextEditingController _description;
  late TextEditingController _detail;
  late TextEditingController _classify;
  late TextEditingController _image;
  late TextEditingController _price;
  late String? userId;
  int _currentValue = 0;

  late AnimationController _controllerAnimation;
  bool animationCompleted = false;

  // late ProductsController productsController;
  @override
  void initState() {
    super.initState();
    _controllerAnimation =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _title = TextEditingController();
    _description = TextEditingController();
    _detail = TextEditingController();
    _classify = TextEditingController();
    _image = TextEditingController();
    _price = TextEditingController();
    listStore(); // Call listStore to fetch data when the widget initializes
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerAnimation.dispose();
  }

  bool submit = false;

  Future<void> addProducts() async {
    SharedPreferences local = await SharedPreferences.getInstance();
    setState(() {
      userId = local.getString('userId');
    });
    if (userId != null &&
        _title.text.isNotEmpty &&
        _description.text.isNotEmpty &&
        _detail.text.isNotEmpty &&
        _image.text.isNotEmpty &&
        _price.text.isNotEmpty) {
      var regBody = {
        "UserId": local.getString('userId'),
        "title": _title.text,
        "description": _description.text,
        "detail": _detail.text,
        "classify": _classify.text,
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

  Future<void> updateProducts(String id) async {
    print(id);
    SharedPreferences local = await SharedPreferences.getInstance();
    // setState(() {
    //   id = local.getString('id');
    // });
    if (id != null &&
        _title.text.isNotEmpty &&
        _description.text.isNotEmpty &&
        _detail.text.isNotEmpty &&
        _image.text.isNotEmpty &&
        _price.text.isNotEmpty) {
      var regBody = {
        "UserId": local.getString('userId'),
        "title": _title.text,
        "description": _description.text,
        "detail": _detail.text,
        "image": _image.text,
        "price": _price.text,
      };
      print(regBody);
      var response = await http.put(
        Uri.parse('$updateProduct$id'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );
      print('1123423');

      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      if (jsonResponse['status'] != null && jsonResponse['status']) {
        print('2234');
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
      appBar: AppBar(
        backgroundColor: Color(0xff81AA66),
        title: Text('Products'),
      ),
      backgroundColor: Colors.grey.shade50,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: LiquidPullToRefresh(
          showChildOpacityTransition: false,
          animSpeedFactor: 5,
          height: 70,
          backgroundColor: Colors.white,
          color: Color(0xff81AA66),
          onRefresh: _handlRefresh,
          child: ListView(
            children: [
              items == null
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
                          backgroundColor: Color(0xff81AA66),
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Edit',
                          onPressed: (BuildContext context) {
                            _displayEdit(context, items![index]);
                          },
                        ),
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
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        '${items![index]['image']}'
                                    )
                                )
                            ),
                          ),
                        ),
                        title: Text('${items![index]['title']}', style: TextStyle(fontWeight: FontWeight.w700),),
                        subtitle: Text('${items![index]['description']}'),
                        trailing: SizedBox(
                          height: 100,
                          width: 100,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                              elevation: MaterialStatePropertyAll(0),
                            ),
                            child: Lottie.asset('lib/assets/buy.json',
                                width: 100, height: 150),
                            onPressed: () {
                              _showDialogCart(context, items![index]);
                            },
                          ),
                        ),
                        // Text('${items![index]['price']}\$'),
                        onTap: () {
                          _showDialog(context, items![index]);
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(top: 0),
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
            height: MediaQuery.of(context).size.height * 0.7,
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${item['title']}', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),),
                SizedBox(height: 10,),
                Image(image: NetworkImage('${item['image']}')),
                SizedBox(height: 20,),
                Text('Ý nghĩa loài hoa', style: TextStyle(fontWeight: FontWeight.w600),),
                SizedBox(height: 5,),
                Text('${item['detail']}', textAlign: TextAlign.justify,),
                Lottie.asset('lib/assets/sale.json', height: 100, width: 100),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDialogCart(BuildContext context, Map<String, dynamic> item) {
    final cartController = Get.put(CartController());
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Colors.brown.shade200,
              content: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width *
                    0.8, // Sửa lại chiều rộng
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NumberPicker(
                      itemCount: 6,
                      itemHeight: 45,
                      itemWidth: 45,
                      axis: Axis.horizontal,
                      value: _currentValue,
                      minValue: 0,
                      maxValue: 100,
                      onChanged: (v) {
                        setState(() {
                          _currentValue = v; // Cập nhật giá trị khi thay đổi
                          _price.text = (v * (item['price'])).toString();
                          // print('cehckk-----------' + ${(item['price']).runtimeType);
                          print(item['price']);
                        });
                      },
                    ),
                    Text('Số lượng: $_currentValue'),
                    // Text('Giá: ${item['price']}\$'),
                    Text('Giá: ${_price.text}\$'),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.green.shade100),
                        child: InkWell(
                          onTap: () {
                            Future.delayed(
                              Duration(seconds: 2),
                                  () {
                                // Add product to the cart
                                Cart cart = Cart(
                                  userId: item['UserId'],
                                  title: item['title'],
                                  description: item['description'],
                                  image: item['image'],
                                  price: _price.text,
                                );
                                cartController.addProductToCart(cart);
                                print(cart);
                                // Close the dialog
                                Navigator.pop(context);
                              },
                            );
                          },
                          child: InkWell(
                            child: Lottie.asset(
                              'lib/assets/buys.json',
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _displayEdit(
      BuildContext context, Map<String, dynamic> item) async {
    final String id = item['_id'] ?? '';
    _title.text = item['title'] ?? '';
    _description.text = item['description'] ?? '';
    _detail.text = item['detail'] ?? '';
    _classify.text = item['classify'] ?? '';
    _image.text = item['image'] ?? '';
    _price.text = item['price']?.toString() ?? '';
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Product'),
          content: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.57,
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
                    controller: _detail,
                    decoration: InputDecoration(
                        hintText: 'Detail product...',
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
                    controller: _classify,
                    decoration: InputDecoration(
                        hintText: 'Classify...',
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
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            InkWell(
              child: Lottie.asset(
                'lib/assets/submit.json',
                width: 100,
                height: 100,
              ),
              onTap: () {
                if (submit == false) {
                  submit = true;
                }
                Future.delayed(Duration(seconds: 2), () {
                  updateProducts('$id');
                  animationCompleted = true;
                });
              },
            ),
          ],
        );
      },
    );
  }
}