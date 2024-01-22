import 'package:flutter/material.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: CircleAvatar(child: Icon(Icons.arrow_back)),
        ),
        title: Text('Privacy Policy', style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cancelation Policy',  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500, color: Colors.brown),),
                Text('Cancelation Policy',  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500, color: Colors.brown),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
