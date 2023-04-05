import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_miner/screen/main_page/controller/main_controller.dart';
import 'package:fb_miner/utils/fire_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Note_Page extends StatefulWidget {
  const Note_Page({Key? key}) : super(key: key);

  @override
  State<Note_Page> createState() => _Note_PageState();
}

class _Note_PageState extends State<Note_Page> {
  Main_Controller main_controller =Get.put(Main_Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: StreamBuilder<QuerySnapshot>(
            stream: Fire_Helepr.fire_helepr.getCategory(),
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return Text("${snapshot.error}");
              }
              else if(snapshot.hasData)
                {
                  List l1=[];
                  var x = snapshot.data;
                  var z = x!.docs;

                  for(var q in z){
                    Map? a =q.data() as Map?;
                    l1.add({"name":a!['name'],"id":q.id});
                  }
                  String? selectCategory = l1.isNotEmpty ? l1[0]['name']:null;
                  return l1.isNotEmpty ? ListView.builder(itemCount: l1.length,itemBuilder: (context, index) {
                    return Container(
                      color: Colors.yellow,
                      margin: EdgeInsets.all(5),
                      child: ListTile(
                        leading: Text("$index"),
                        title: Text("${l1[index]['name']}",style: TextStyle(color: Colors.black87),),
                        trailing: Padding(
                          padding:  EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: (){
                                Get.defaultDialog(
                                  content: TextField(
                                    controller: main_controller.textAdd,
                                  ),
                                  actions: [
                                    ElevatedButton(onPressed: (){
                                      Fire_Helepr.fire_helepr.updateCategory(main_controller.textAdd.text, l1[index]['id']);
                                      main_controller.textAdd.clear();
                                      Get.back();
                                    }, child: Text("Submit"))
                                  ]
                                );
                              },icon: Icon(Icons.edit,color: Colors.black87,),),
                              SizedBox(width: 10,),
                              IconButton(onPressed: (){
                                Fire_Helepr.fire_helepr.deleteCategory(l1[index]['id']);
                              }, icon:Icon(Icons.delete,color: Colors.black87,),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },) : Center(child: Text("Please add Your Note"),);
                }
              return CircularProgressIndicator();
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Get.toNamed('addnote');
            },
            backgroundColor: Colors.red,
            child: Icon(Icons.add,color: Colors.white,),
          ),
        )
    );
  }
}
