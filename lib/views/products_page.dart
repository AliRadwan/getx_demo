import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/business_logic/controllers/products.dart';
import 'package:getx_demo/business_logic/services/dummy_api.dart';
import 'package:getx_demo/views/wish_list_screen.dart';

class ProductsScreen extends StatelessWidget {

  const ProductsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final MyHomePageController controller = Get.put(MyHomePageController());

    //  here we get the same instance of the api class
    final apiServices = Get.find<ApiServices>();
    // Instantiate our Products class using Get.put()
    final ProductsController data = Get.find<ProductsController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('About GetX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'GetX is an extra-light and powerful solution for Flutter. It combines high performance state management, intelligent dependency injection, and route management in a quick and practical way.',
              ),
            ),
            TextButton(
                onPressed: ()=> print(apiServices.getMyData()),
                child: const Text('Get Data')
            ),

            TextButton(
                onPressed: ()=> Get.back(),
                child: const Text('Go Home')
            ),

            InkWell(
              child: Container(
                width: 300,
                height: 80,
                color: Colors.red,
                alignment: Alignment.center,
                // Use Obx(()=> to update Text() whenever _wishList.items.length is changed
                child: Obx(() => Text(
                  'Wish List: ${data.wishListItems.length}',
                  style: const TextStyle(fontSize: 28, color: Colors.white),
                )),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WishListScreen())),
            ),

            Expanded(
              // Display all products in home screen
                child: ListView.builder(
                    itemCount: data.items.length,
                    // List item widget
                    itemBuilder: (context, index) {
                      final product = data.items[index];
                      return Card(
                        key: ValueKey(product.id),
                        margin: const EdgeInsets.all(5),
                        color: Colors.amberAccent,
                        child: ListTile(
                          title: Text(product.name),
                          subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                          // Use Obx(()=> to update icon color when product.inWishList change
                          trailing: Obx(() => IconButton(
                            onPressed: () {
                              if (product.inWishList.value == false) {
                                data.addItem(product.id);
                              } else {
                                data.removeItem(product.id);
                              }
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: product.inWishList.value == false
                                  ? Colors.white
                                  : Colors.red,
                            ),
                          )),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
