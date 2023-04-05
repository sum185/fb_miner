import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Book_Controller extends GetxController
{
  TextEditingController txtname =TextEditingController();
  Rx<TextEditingController> txtimg =TextEditingController().obs;
  TextEditingController txtAname =TextEditingController();
  TextEditingController txtAabout =TextEditingController();
  TextEditingController txtBabout =TextEditingController();
  TextEditingController txtrate =TextEditingController();
  TextEditingController txtPyear =TextEditingController();

  GlobalKey<FormState> key =GlobalKey<FormState>();
}