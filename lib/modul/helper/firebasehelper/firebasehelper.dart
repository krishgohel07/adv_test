import 'package:adv_flutter_test/modul/model/notedata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  FirebaseHelper._();

  static final FirebaseHelper firebaseHelper = FirebaseHelper._();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> uploadnotes(String title,String note) async {
    await firebaseFirestore.collection('notes').doc().set({
      'title': title,
      'note': note,
      'time': DateTime.now(),
    });
  }


  Future<List<QueryDocumentSnapshot>> fetchAllUserData() async {
    QuerySnapshot querySnapshot = await firebaseFirestore
        .collection('notes')
        .get();

    List<QueryDocumentSnapshot> data = querySnapshot.docs;
    return data;
  }
}
