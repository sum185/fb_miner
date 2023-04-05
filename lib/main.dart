import 'package:fb_miner/screen/book_page/view/addbook_page.dart';
import 'package:fb_miner/screen/main_page/view/main_page.dart';
import 'package:fb_miner/screen/note_page/view/addnote_page.dart';
import 'package:fb_miner/screen/sigin_page/view/sigin_page.dart';
import 'package:fb_miner/screen/sigup_page/view/sigup_page.dart';
import 'package:fb_miner/screen/splash_page/view/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
void main()async
{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: 'splash',
      routes: {
        'splash':(p0) => Splash_Page(),
        'sigin':(p0) => Signi_Page(),
        'sigup':(p0) => Sigup_Page(),
        'main':(p0) => Main_Page(),
        'addnote':(p0) => AddNote_Page(),
        'addBook':(p0) => AddBook_Page(),
      },
    )
  );
}