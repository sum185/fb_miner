import 'package:fb_miner/screen/main_page/controller/main_controller.dart';
import 'package:fb_miner/utils/fire_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Main_Page extends StatefulWidget {
  const Main_Page({Key? key}) : super(key: key);

  @override
  State<Main_Page> createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  Main_Controller main_controller = Get.put(Main_Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.blueAccent,
           centerTitle: true,
           title: Text("Main Page",style: TextStyle(color: Colors.white),),
           actions: [
             IconButton(onPressed: (){
               Fire_Helepr.fire_helepr.LogoutAccount();
               Get.offNamed('sigin');
             }, icon: Icon(Icons.power_settings_new,color: Colors.white,))
           ],
         ),
          body: Obx(
            () => main_controller.p1[main_controller.index.value],
          ),
          bottomNavigationBar: Obx(
            () =>  BottomNavigationBar(
              onTap: (index){
                main_controller.index.value = index;
              },
              currentIndex: main_controller.index.value,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.note_add_rounded,color: Colors.black,),label: "Note"),
                BottomNavigationBarItem(icon: Icon(Icons.book_outlined,color: Colors.black,),label: "Book")
              ],
            ),
          ),
        )
    );
  }
}
