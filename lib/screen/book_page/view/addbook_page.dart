import 'package:fb_miner/screen/book_page/controller/book_controller.dart';
import 'package:fb_miner/screen/book_page/model/book_model.dart';
import 'package:fb_miner/utils/fire_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class AddBook_Page extends StatefulWidget {
  const AddBook_Page({Key? key}) : super(key: key);

  @override
  State<AddBook_Page> createState() => _AddBook_PageState();
}

class _AddBook_PageState extends State<AddBook_Page> {
  Book_Controller book_controller =Book_Controller();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Form(
          key: book_controller.key,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Add Book",style: TextStyle(color: Colors.white),),
              centerTitle: true,
              backgroundColor: Colors.blueAccent,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.only(top: 20,left: 8,right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Book Name",
                      style: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold),
                    ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                    controller: book_controller.txtname,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter book name";
                      }
                    },
                ),
                  ),
                    SizedBox(height: 10,),
                    Text(
                      "Auther Name",
                      style: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: book_controller.txtAname,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter auther name";
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Upload Book Image",
                      style: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 70,
                          width: 200,
                          child: Obx(
                            () =>  TextFormField(
                              controller: book_controller.txtimg.value,
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Upload book image";
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        IconButton(onPressed: (){
                          showModalBottomSheet(context: context, builder: (context) {
                            return BottomSheet(onClosing: (){}, builder: (context) {
                              return Container(
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      IconButton(onPressed: () async {
                                          ImagePicker imageP=ImagePicker();
                                          XFile? ima=await imageP.pickImage(source: ImageSource.gallery);
                                          book_controller.txtimg.value=TextEditingController(text: "${ima!.path}");
                                        }, icon: Icon(
                                          Icons.image_outlined,
                                          color: Colors.black87,
                                        ),),
                                      SizedBox(width: 30,),
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.black87,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },);
                          },);
                        }, icon: Icon(Icons.image_outlined,color: Colors.black87,size: 30,))
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Auther About",
                      style: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: TextFormField(
                        controller: book_controller.txtAabout,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter auther about";
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Book About",
                      style: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: book_controller.txtBabout,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter book about";
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Book Rate",
                      style: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: book_controller.txtrate,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter book rating";
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Book Publish Year",
                      style: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: book_controller.txtPyear,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter book publish year";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 20,left: 20),
                      child: InkWell(
                        onTap: (){
                          if(book_controller.key.currentState!.validate())
                            {
                              Book_Model b1 =Book_Model(
                                name: book_controller.txtname.text,
                                author_name: book_controller.txtAname.text,
                                image: book_controller.txtimg.value.text,
                                author_about: book_controller.txtAabout.text,
                                book_about: book_controller.txtBabout.text,
                                rating: book_controller.txtrate.text,
                                publish_year: book_controller.txtPyear.text,
                              );
                              Fire_Helepr.fire_helepr.addBook(b1);
                              Get.back();
                              book_controller.txtname.clear();
                              book_controller.txtAname.clear();
                              book_controller.txtimg.value.clear();
                              book_controller.txtAabout.clear();
                              book_controller.txtBabout.clear();
                              book_controller.txtrate.clear();
                              book_controller.txtPyear.clear();
                            }
                          else
                            {
                               Get.snackbar("Failed", "Please enter your detail");
                            }
                        },
                        child: Container(
                          height: 50,
                          width: 300,
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
            ),
          ),
        )
    );
  }
}
