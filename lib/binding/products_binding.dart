import 'package:get/get.dart';
import 'package:getx_demo/business_logic/controllers/products.dart';

class ProductsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductsController());
  }

}