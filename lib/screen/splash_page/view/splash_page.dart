import 'dart:async';
import 'package:fb_miner/screen/sigin_page/controller/sigin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Splash_Page extends StatefulWidget {
  const Splash_Page({Key? key}) : super(key: key);

  @override
  State<Splash_Page> createState() => _Splash_PageState();
}

class _Splash_PageState extends State<Splash_Page> {
  Sigin_Controller sigin_controller = Get.put(Sigin_Controller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      sigin_controller.IsLogin();
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueAccent,
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Image.asset("asset/image/fire.png",width: 150,height: 150,fit: BoxFit.contain,),
                      Text("Firebase",style: TextStyle(color: Colors.black54,fontSize: 40),)
                    ],
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: 150),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.yellow,
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: 20),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("Powered by Summer ltd",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
              )
            ],
          )
        )
    );
  }
}
