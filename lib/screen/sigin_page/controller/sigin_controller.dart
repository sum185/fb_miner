import 'package:fb_miner/utils/fire_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Sigin_Controller extends GetxController
{
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController textEmail =TextEditingController();
  TextEditingController textPass =TextEditingController();


  void IsLogin()
  async{
   bool? Login = await Fire_Helepr.fire_helepr.checkUserLogin();
   if(Login)
     {
       Get.offNamed('main');
     }
   else
     {
       Get.offNamed('sigin');
     }
  }

}