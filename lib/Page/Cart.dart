import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final List<dynamic> cartItems;

  CartScreen({required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void removeFromCart(BuildContext context, int index) {
    var removedProduct = widget.cartItems.removeAt(index);

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(
    //   height: 70,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10),
    //     color: Color(0xff81AA66),
    //   ),
    //   child: Column(
    //     children: [
    //       Text('${removedProduct['title']} removed from Cart')
    //     ],
    //   ),
    // )));

    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(content: Text('${removedProduct['title']} removed from Cart'), duration: Duration(seconds: 1),),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    // Set quantity to 1 for all items in widget.cartItems
    for (var item in widget.cartItems) {
      item['quantity'] = 1;
    }
  }

  void incrementQuantity(int index) {
    setState(() {
      widget.cartItems[index]['quantity']++;
    });
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in widget.cartItems) {
      total += double.parse(item['price'].toString()) * item['quantity'];
    }
    return total;
  }

  void decrementQuantity(int index) {
    if (widget.cartItems[index]['quantity'] > 1) {
      setState(() {
        widget.cartItems[index]['quantity']--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff81AA66),
        title: Text('Shopping Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 16, right: 16, bottom: 20),
        child: widget.cartItems.isEmpty
            ? Center(child: Text('Your cart is empty.'))
            : ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  var cartItem = widget.cartItems[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xff81AA66).withOpacity(0.3),
                      border: Border(
                        bottom: BorderSide(color: Colors.white, width: 10)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(image: NetworkImage(cartItem['image']),width: 100,height: 100, fit: BoxFit.cover,),
                        ),
                        ListTile(
                          title: Text(cartItem['title'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cartItem['description'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                              Text('Quantity: ${cartItem['quantity']}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  incrementQuantity(index);
                                },
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xff81AA66),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Icon(Icons.add, color: Colors.white)),
                              ),
                              SizedBox(width: 5,),
                              InkWell(
                                onTap: () {
                                  decrementQuantity(index);
                                },
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xff81AA66),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Icon(Icons.remove, color: Colors.white)),
                              ),
                              SizedBox(width: 5,),
                              InkWell(
                                onTap: () {
                                  removeFromCart(context, index);
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xff81AA66),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Icon(Icons.delete_forever, color: Colors.white,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff81AA66),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price: ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                '\$${calculateTotalPrice().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
