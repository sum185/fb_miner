import 'package:fb_miner/screen/book_page/view/book_page.dart';
import 'package:fb_miner/screen/note_page/view/note_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Main_Controller extends GetxController
{
  TextEditingController textAdd = TextEditingController();
  RxInt index =0.obs;
  List p1=[Note_Page(),Book_Page()];
}