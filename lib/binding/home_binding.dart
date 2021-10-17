import 'package:get/get.dart';
import 'package:getx_demo/business_logic/controllers/my_home_page_controller.dart';
import 'package:getx_demo/business_logic/controllers/products.dart';
import 'package:getx_demo/business_logic/services/dummy_api.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {

    Get.put(ApiServices());
    Get.lazyPut(() => MyHomePageController());
    Get.put(ProductsController());

  }


}