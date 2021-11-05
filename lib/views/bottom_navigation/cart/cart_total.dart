import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/business_logic/controllers/cart_controller.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
   CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Container(
          padding: EdgeInsets.symmetric(horizontal: 75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total'),
            Text('${controller.total}'),

          ],
        ),
      ),
    );
  }
}
