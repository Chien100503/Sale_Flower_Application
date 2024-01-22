import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
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
        title: Text('Payment Methods', style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Credit & Debit Card', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Color(0xffc1c1c4))
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(Icons.payment_rounded, color: Colors.brown,),
                      ),
                      SizedBox(
                          width: 280,
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: 'Add New Card',
                                hintStyle: TextStyle(
                                    color: Colors.black26,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                          )
                      ),
                      InkWell(
                        child: Text('Link', style: TextStyle(color: Colors.brown, fontSize: 18),),),
                    ],
                  )
                ),
                SizedBox(height: 20,),
                Text('Credit & Debit Card', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),),
                SizedBox(height: 10,),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        border: Border.all(width: 1, color: Color(0xffc1c1c4))
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(Icons.payment_rounded, color: Colors.brown,),
                        ),
                        SizedBox(
                            width: 280,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: 'Apple pay',
                                  hintStyle: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            )
                        ),
                        InkWell(
                          child: Text('Link', style: TextStyle(color: Colors.brown, fontSize: 18),),),
                      ],
                    )
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        border: Border.all(width: 1, color: Color(0xffc1c1c4))
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(Icons.payment_rounded, color: Colors.brown,),
                        ),
                        SizedBox(
                            width: 280,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: 'Paypal',
                                  hintStyle: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            )
                        ),
                        InkWell(
                          child: Text('Link', style: TextStyle(color: Colors.brown, fontSize: 18),),),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
