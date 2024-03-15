import 'package:adv_flutter_test/modul/helper/firebasehelper/firebasehelper.dart';
import 'package:adv_flutter_test/modul/model/notedata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  List<Notedata>? alldata;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    try {
      // Fetch data from Firebase
      List<QueryDocumentSnapshot> data =
      await FirebaseHelper.firebaseHelper.fetchAllUserData();
      alldata = data
          .map((e) =>
          Notedata(
            title: e['title'],
            note: e['note'],
            time: e['time'],
          ))
          .toList();
      update(); // Notify listeners that data has changed
    } catch (e) {
      // Handle error
      print('Error fetching data: $e');
    }
  }
}
