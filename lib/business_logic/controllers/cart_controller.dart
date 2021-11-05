import 'package:get/get.dart';
import 'package:getx_demo/business_logic/models/product.dart';

class CartController extends GetxController{


  var _products = {}.obs;
  var count =  0.obs;

  void addProduct(Product product){
    if(_products.containsKey(product)) {
      _products[product] += 1;
      count ++;
    }else {
      _products[product] = 1;
    }

    Get.snackbar("Product Add", "You have Added ${product.name} to the cart",
    duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM
    );
  }


  void removeProduct(Product product){
    if(_products.containsKey(product)&& _products[product]==1){
      _products.removeWhere((key, value) => key ==product);
    }else{
      _products[product] -=1;
      count --;
    }
  }



  get products =>_products;

  get profuctSubTotal => _products.entries.map((product) => product.key.price * product.value).toList();


  get total => _products.entries.map((product) => product.key.price * product.value).
  toList().reduce((value, element) => value + element).toStringAsFixed(2);


}