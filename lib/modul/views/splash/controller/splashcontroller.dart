import 'dart:async';

import 'package:adv_flutter_test/modul/views/homepage/controller/homepagecontroller.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    HomePageController().onInit();
    Timer(Duration(seconds: 3), () {
      Get.toNamed('/');
    });
  }
}