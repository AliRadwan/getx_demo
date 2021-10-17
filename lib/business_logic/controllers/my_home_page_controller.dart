import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/views/products_page.dart';
import 'package:getx_demo/views/my_home_page.dart';
import 'package:getx_demo/views/wish_list_screen.dart';

class MyHomePageController extends GetxController {

  final count = 0.obs;

  increment() => count.value++;


  int _navigatiorValue = 0;
  get navigatorValue => _navigatiorValue;

  Widget _currentScreen  =  const MyHomePage();
  get currentScreen => _currentScreen;

  void ChangeSelectedValue(int seleet){
    _navigatiorValue = seleet;
    switch(seleet){
      case 0 :
        {
          _currentScreen = const MyHomePage();
          break;
        }
      case 1 :
        {
          _currentScreen = const ProductsScreen();
          break;
        }
      case 2 :
        {
          _currentScreen = const WishListScreen();
          break;
        }
    }
    update();
  }

}
