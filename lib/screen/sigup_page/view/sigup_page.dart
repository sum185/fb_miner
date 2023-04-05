import 'package:fb_miner/screen/sigup_page/controller/sigup_controller.dart';
import 'package:fb_miner/utils/fire_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Sigup_Page extends StatefulWidget {
  const Sigup_Page({Key? key}) : super(key: key);

  @override
  State<Sigup_Page> createState() => _Sigup_PageState();
}

class _Sigup_PageState extends State<Sigup_Page> {
  Sigup_Controller sigup_controller = Get.put(Sigup_Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Form(
          key: sigup_controller.key2,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding:  EdgeInsets.only(top: 70,left: 8,right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(bottom: 50,left: 70),
                        child: Text("Create Account",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
                      ),
                      SizedBox(
                          height: 60,
                          child: Text("Sign Up",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 20),)),
                      Text("Your Full Name",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: sigup_controller.textName,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45,width: 1),borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45,width: 1),borderRadius: BorderRadius.circular(10))
                          ),
                          validator: (value){
                            if(value!.isEmpty)
                              {
                                return "Please Enter your Name";
                              }
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Your Email",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: sigup_controller.textEmail,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45,width: 1),borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45,width: 1),borderRadius: BorderRadius.circular(10))
                          ),
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return "Please Enter your Email";
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Password",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: sigup_controller.textPass,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45,width: 1),borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45,width: 1),borderRadius: BorderRadius.circular(10))
                          ),
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return "Please Enter your Password";
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 50,),
                      Padding(
                        padding:  EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: (){
                            if(sigup_controller.key2.currentState!.validate())
                              {
                                Fire_Helepr.fire_helepr.CtreateAccount(sigup_controller.textEmail.text, sigup_controller.textPass.text);
                                Get.back();
                              }
                            else
                              {
                                Get.snackbar("Failed", "Enter Username Or Password");
                              }
                          },
                          child: Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(color: Colors.blue.shade200,blurRadius: 2,offset: Offset(8,8),)
                                ]
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Sign Up",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 60,top: 40),
                        child: Row(
                          children: [
                            Text("Already a User?",style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.bold),),
                            TextButton(onPressed: (){
                              Get.back();
                            }, child: Text("Login",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 18),))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
