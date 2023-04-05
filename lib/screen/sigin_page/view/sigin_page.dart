import 'package:fb_miner/screen/sigin_page/controller/sigin_controller.dart';
import 'package:fb_miner/utils/fire_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signi_Page extends StatefulWidget {
  const Signi_Page({Key? key}) : super(key: key);

  @override
  State<Signi_Page> createState() => _Signi_PageState();
}

class _Signi_PageState extends State<Signi_Page> {
  Sigin_Controller sigin_controller = Get.put(Sigin_Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
          key: sigin_controller.key,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 70, left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 50, left: 70),
                        child: Text(
                          "Welcome Back",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                      SizedBox(
                          height: 60,
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      Text(
                        "Your Email/User Name",
                        style: TextStyle(
                            color: Colors.black45, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: sigin_controller.textEmail,
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
                              return "Please Enter the Email";
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.black45, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: sigin_controller.textPass,
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
                              return "Please Enter the Password";
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () async {
                            bool? r1 = await Fire_Helepr.fire_helepr
                                .ReadAccount(sigin_controller.textEmail.text,
                                    sigin_controller.textPass.text);

                            if(sigin_controller.key.currentState!.validate())
                              {
                                if(r1==false)
                                  {
                                    Get.snackbar("Error", "Wrong Email or Password");
                                  }
                                else
                                  {
                                    Get.offNamed('main');
                                  }
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
                              "Login",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40, top: 40),
                        child: Row(
                          children: [
                            Text(
                              "Are you a new User?",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed('sigup');
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Center(
                                child: Image.asset(
                              "asset/image/google.png",
                              fit: BoxFit.cover,
                            )),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Center(
                                child: Image.asset(
                              "asset/image/facebook.png",
                              fit: BoxFit.cover,
                            )),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Center(
                              child: Image.asset(
                                "asset/image/twitter.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
