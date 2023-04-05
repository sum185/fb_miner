import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_miner/screen/book_page/model/book_model.dart';
import 'package:fb_miner/utils/fire_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Book_Page extends StatefulWidget {
  const Book_Page({Key? key}) : super(key: key);

  @override
  State<Book_Page> createState() => _Book_PageState();
}

class _Book_PageState extends State<Book_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black12,
      body: StreamBuilder<QuerySnapshot>(
        stream: Fire_Helepr.fire_helepr.readBook(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<Book_Model> l1 = [];
            var x = snapshot.data;
            var z = x!.docs;

            for (var q in z) {
              Map? a = q.data() as Map?;
              l1.add(Book_Model(
                  name: a!['name'],
                  id: q.id,
                  author_name: a!['author_nmae'],
                  image: a!['image'],
                  author_about: a!['author_about'],
                  book_about: a!['book_about'],
                  rating: a!['rating'],
                  publish_year: a!['publish_year']));
            }
            return l1.isNotEmpty? ListView.builder(
              itemCount: l1.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 200,
                          width: 280,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.only(left: 100,right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${l1[index].name}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                "${l1[index].rating}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20,),
                              Text(
                                "${l1[index].book_about}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.black,)),
                                  SizedBox(width: 20,),
                                  IconButton(onPressed: (){
                                    Fire_Helepr.fire_helepr.deleteBook(l1[index].id!);
                                  }, icon: Icon(Icons.delete,color: Colors.black,)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 230, top: 30),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 150,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      offset: Offset(2, 2),
                                      color: Colors.black)
                                ]),
                            child: Image.file(
                              File(l1[index].image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ):Center(child: Text("Please add Your Book"),);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('addBook');
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    ));
  }
}
