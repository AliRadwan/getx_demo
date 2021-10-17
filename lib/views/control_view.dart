import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/business_logic/controllers/my_home_page_controller.dart';

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyHomePageController>(
        builder:(controller)=> Scaffold(body: controller.currentScreen,
        bottomNavigationBar:bottomNavigationBar() ,
        ));
  }


  Widget bottomNavigationBar() {
    return  GetBuilder<MyHomePageController>(
      init: MyHomePageController(),
      builder: (controller)=> BottomNavigationBar(items:const [
        BottomNavigationBarItem(icon: Icon(Icons.home),activeIcon: Text("home"),label: " "),
        BottomNavigationBarItem(icon: Icon(Icons.info),activeIcon: Text("about"),label: " "),
        BottomNavigationBarItem(icon: Icon(Icons.add),activeIcon: Text("Ali"),label: " "),
      ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.ChangeSelectedValue(index);

        },

      ),
    );
  }

}
