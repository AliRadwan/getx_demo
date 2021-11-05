import 'package:flutter/material.dart';
import 'package:getx_demo/views/bottom_navigation/cart/cart.dart';

import 'cart_total.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CartProducts(),
            CartTotal()
          ],
        ),
      ),
    );
  }
}
