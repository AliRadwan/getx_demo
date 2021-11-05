import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/business_logic/controllers/cart_controller.dart';
import 'package:getx_demo/business_logic/models/product.dart';

class CatalogProducts extends StatelessWidget {
  const CatalogProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView.builder(
          itemCount: Product.products.length,
          itemBuilder:(BuildContext context,int index) {
            return CatalogProductCard(index: index,);
          } ),
    );
  }
}


class CatalogProductCard extends StatelessWidget {
  // final cartController = Get.put(CartController());
  final CartController cartController = Get.find();

  final int index;

   CatalogProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(padding:
    const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
            Product.products[index].imageUrl
          ),
        ),

        const SizedBox(width: 20,),
        Expanded(child: Text(Product.products[index].name)),
        Expanded(child: Text('${Product.products[index].price}')),
        IconButton(onPressed: (){
          cartController.addProduct(Product.products[index]);
        }, icon: const Icon(
           Icons.add_circle
        ))

      ],
    ),
    );
  }
}
