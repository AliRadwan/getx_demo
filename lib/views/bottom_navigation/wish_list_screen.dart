// screens/wish_list_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/business_logic/controllers/products.dart';
import 'package:getx_demo/views/bottom_navigation/cart/cart.dart';

import 'cart/catalog_products.dart';
import 'cart/catalog_screen.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  // Ask Get to find our "controller"

  @override
  Widget build(BuildContext context) {
    final ProductsController _productsController = Get.find<ProductsController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('WishList'),
          actions: [
            IconButton(onPressed: (){
              Get.to( CatalogScreen());
            },
                icon:const Icon(Icons.shopping_cart_outlined)
            )
          ],
        ),
        body: Obx(
              () => ListView.builder(
            itemCount: _productsController.wishListItems.length,
            itemBuilder: (context, index) {
              final item = _productsController.wishListItems[index];
              return Card(
                key: ValueKey(item.id),
                margin:const EdgeInsets.all(5),
                color: Colors.blue[200],
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  // This button use to remove )the item from wish list
                  trailing: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      item.inWishList.value = false;
                      _productsController.removeItem(item.id);
                    },
                  ),
                ),
              );
            },
          ),
        ));
  }
}