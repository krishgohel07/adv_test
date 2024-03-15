import 'package:cloud_firestore/cloud_firestore.dart';

class Notedata {
  String note;
  String title;
  Timestamp time;

  Notedata({required this.title,required this.note,required this.time});
  @override
  String toString() {
    return 'Notedata{title: $title, note: $note, time: $time}';
  }
}
