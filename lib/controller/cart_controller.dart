import 'package:cannabis/model/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // add a dict to store the product in the cart.
  // var _product = <Map<String, dynamic>>[].obs;
  var _product = {}.obs;

  void addProductToCart(Cart cart) {
    if (_product.containsKey(cart)) {
      _product[cart] += 1;
    } else {
      _product[cart] = 1;
    }
    Get.snackbar('Add cart success', 'You have added the ${cart.title}',
    snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2)
    );
  }
}
