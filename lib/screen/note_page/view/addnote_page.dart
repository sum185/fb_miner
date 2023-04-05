import 'package:fb_miner/screen/main_page/controller/main_controller.dart';
import 'package:fb_miner/utils/fire_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddNote_Page extends StatefulWidget {
  const AddNote_Page({Key? key}) : super(key: key);

  @override
  State<AddNote_Page> createState() => _AddNote_PageState();
}

class _AddNote_PageState extends State<AddNote_Page> {
  Main_Controller main_controller = Get.put(Main_Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Text("Add Note",style: TextStyle(color: Colors.white),),
            centerTitle: true,
          ),
          body: Padding(
            padding:  EdgeInsets.only(top: 20,left: 8,right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add Note",style: TextStyle(
                    color: Colors.black45, fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: main_controller.textAdd,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black45, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black45, width: 1),
                            borderRadius: BorderRadius.circular(10))),

                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 60,top: 40),
                  child: InkWell(
                    onTap: (){
                      Fire_Helepr.fire_helepr.addcategory(main_controller.textAdd.text);
                      Get.back();
                      main_controller.textAdd.clear();
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.shade200,
                              blurRadius: 2,
                              offset: Offset(8, 8),
                            )
                          ]),
                      alignment: Alignment.center,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
