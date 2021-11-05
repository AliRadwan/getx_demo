import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/business_logic/controllers/my_home_page_controller.dart';
import 'package:getx_demo/business_logic/controllers/products.dart';
import 'package:getx_demo/business_logic/services/dummy_api.dart';
import 'package:getx_demo/views/bottom_navigation/wish_list_screen.dart';
import 'products_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final MyHomePageController controller = Get.find<MyHomePageController>();

    //  here we create new instance of the api class
    final apiServices = Get.find<ApiServices>();

    return Scaffold(
      appBar: AppBar(
        title: Text("GETX"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text('${controller.count.value}',style: Theme.of(context).textTheme.headline4)),
            TextButton(
                onPressed: ()=> print(apiServices.getMyData()),
                child: const Text('Get Data')
            ),
            TextButton(
                onPressed: () {
                  Get.to(const ProductsScreen());
                  Get.toNamed("/about");
                },
                child: const Text('About GetX')),
            TextButton(
                onPressed: () {
                  Get.snackbar('GetX Snackbar', 'Yay! Awesome GetX Snackbar',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.amberAccent);
                },
                child: const Text('Show Snackbar')),
            TextButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: 'GetX Alert',
                      middleText: 'Simple GetX alert',
                      textConfirm: 'Okay',
                      confirmTextColor: Colors.amberAccent,
                      textCancel: 'Cancel');
                  },
                child: const Text('Show AlertDialog')),


            const SizedBox(
              height: 20,
            ),
      ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed:controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      // bottomNavigationBar: bottomNavigationBar(),
    );
  }

}
