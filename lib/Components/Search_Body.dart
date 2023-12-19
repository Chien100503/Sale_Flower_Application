import 'package:flutter/material.dart';

class Search_Body extends StatefulWidget {
  const Search_Body({super.key});

  @override
  State<Search_Body> createState() => _Search_BodyState();
}

class _Search_BodyState extends State<Search_Body> {
  late TextEditingController _controller;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void _clearSearch() {
    setState(() {
      _controller.clear();
      _isSearching = false;
    });
  }

  void _onChanged(String value) {
    setState(() {
      _isSearching = value.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(

                    controller: _controller,
                    onChanged: _onChanged,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff81AA66)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: _isSearching
                          ? IconButton(
                        icon: Icon(Icons.close),
                        onPressed: _clearSearch,
                      )
                          : null,
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
