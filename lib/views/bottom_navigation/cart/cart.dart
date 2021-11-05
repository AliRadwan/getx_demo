import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:getx_demo/business_logic/controllers/cart_controller.dart';
import 'package:getx_demo/business_logic/models/product.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
   CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> SizedBox(
height: 600,
        child: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context,int index){
              return CartProudctCard(
                index:index ,
                controller:controller ,
                product: controller.products.keys.toList()[index],
                 quanty: controller.products.values.toList()[index],
              );
            }),
      ),
    );
  }
}

class CartProudctCard extends StatelessWidget {

  final CartController controller;
  final Product product;
  final int quanty;
final int index;


  const CartProudctCard({Key? key,required this.controller,required this.product,required this.quanty, required this.index}) : super(key: key);@override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(4
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(product.imageUrl),
        ),
        SizedBox(width: 20,),
        Expanded(child: Text(product.name)),
    IconButton(onPressed: (){
      controller.removeProduct(product);
    }, icon: Icon(Icons.remove_circle)),
    Text('${quanty}'),
        IconButton(onPressed: (){
          controller.addProduct(product);

        }, icon: Icon(Icons.add_circle)),


      ],
    ),
    );
  }
}
