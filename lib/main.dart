import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/views/products_page.dart';
import 'package:getx_demo/views/control_view.dart';
import './views/my_home_page.dart';
import 'binding/home_binding.dart';
import 'binding/products_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(name: "/", page: ()=> const ControlView()),
        GetPage(name: "/home", page: ()=> const MyHomePage(),binding: HomeBinding()),
        GetPage(name: "/about", page: ()=> const ProductsScreen(),binding: ProductsBinding()),

      ],
      initialBinding: HomeBinding(),
      initialRoute:  '/',
      home:  const ControlView(),
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
