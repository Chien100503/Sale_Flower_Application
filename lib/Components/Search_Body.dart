import "dart:convert";

import "package:cannabis/Components/ProductSearch.dart";
import "package:cannabis/Components/Search_Body.dart";
import "package:cannabis/TabBarProducts/ProductsTab.dart";
import "package:cannabis/model/local/request_apt.dart";
import "package:cannabis/model/post.dart";
import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import 'package:http/http.dart' as http;
import "package:lottie/lottie.dart";

import "../Db/Config.dart";

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  List? items;
  late TextEditingController _title;
  late TextEditingController _description;
  late TextEditingController _detail;
  late TextEditingController _classify;
  late TextEditingController _image;
  late TextEditingController _price;
  late String? userId;
  List? filteredItems;
  late TextEditingController _searchController;

  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController();
    _description = TextEditingController();
    _detail = TextEditingController();
    _classify = TextEditingController();
    _image = TextEditingController();
    _price = TextEditingController();
    _searchController = TextEditingController();
    listStore(); // Call listStore to fetch data when the widget initializes
  }
  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _isSearching = false;
    });
  }

  void _onChanged(String value) {
    setState(() {
      _isSearching = value.isNotEmpty;
    });
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

  void _filterItems(String keyword) {
    setState(() {
      filteredItems = items
          ?.where((item) => item['title']
              .toString()
              .toLowerCase()
              .contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tìm kiếm sản phẩm'),
        backgroundColor: Color(0xff81AA66),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => _filterItems(value),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff81AA66)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(Icons.search, color: Color(0xff81AA66),),
                  suffixIcon: _isSearching
                      ? IconButton(
                    icon: Icon(Icons.close),
                    onPressed: _clearSearch,
                  )
                      : null,
                  hintText: 'What do you want to search?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  // labelText: 'Search',
                  // suffixIcon: IconButton(
                  //   icon: Icon(Icons.clear),
                  //   onPressed: () {
                  //     _searchController.clear();
                  //     _filterItems('');
                  //   },
                  // ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: (_searchController.text.isEmpty &&
                      (filteredItems ?? items) == null)
                  ? Center(child: CircularProgressIndicator())
                  : (_searchController.text.isEmpty)
                      ? Container() // or any other widget/message you want to show when no search query
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: (filteredItems ?? items)!.length,
                          itemBuilder: (context, int index) {
                            return Slidable(
                              key: ValueKey(index),
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 100,
                                        color: Color(0xff81AA66),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text('You Will?'),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 100),
                                                child: Row(
                                                  children: [
                                                    ElevatedButton(

                                                      child: const Text(
                                                          'View detail', style: TextStyle(color: Colors.blueGrey),),
                                                      onPressed: () {
                                                        _showDialog(context,
                                                            items![index]);
                                                      },
                                                      style: ButtonStyle(
                                                        backgroundColor: MaterialStatePropertyAll(Colors.white)
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    ElevatedButton(
                                                      child: const Text(
                                                          'Go to product'),
                                                      style: ButtonStyle(
                                                          backgroundColor: MaterialStatePropertyAll(Colors.blueGrey)
                                                      ),
                                                      onPressed: () =>
                                                          Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProductGoToSearch(),
                                                        ),

                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Card(
                                  borderOnForeground: false,
                                  child: ListTile(
                                    leading: Dialog.fullscreen(
                                      child: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: Image(
                                              image: NetworkImage(
                                                  '${(filteredItems ?? items)![index]['image']}'))),
                                    ),
                                    title: Text(
                                        '${(filteredItems ?? items)![index]['title']}'),
                                    subtitle: Text(
                                        '${(filteredItems ?? items)![index]['description']}'),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
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
                Text(
                  '${item['title']}',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                Image(image: NetworkImage('${item['image']}')),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Ý nghĩa loài hoa',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${item['detail']}',
                  textAlign: TextAlign.justify,
                ),
                Lottie.asset('lib/assets/sale.json', height: 100, width: 100),
              ],
            ),
          ),
        );
      },
    );
  }
}
