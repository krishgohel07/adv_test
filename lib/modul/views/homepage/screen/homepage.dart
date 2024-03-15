// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:adv_flutter_test/modul/helper/firebasehelper/firebasehelper.dart';
import 'package:adv_flutter_test/modul/views/homepage/controller/homepagecontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  HomePageController homePageController = HomePageController();

  @override
  void initState() {
    super.initState();
    // Fetch data from Firebase when the widget is initialized
    homePageController.onInit();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController notecontroller = TextEditingController();
    TextEditingController titlecontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffFED150),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add Note'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titlecontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter title'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    maxLines: 6,
                    controller: notecontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Enter note'),
                  )
                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Back")),
                ElevatedButton(
                    onPressed: () async {
                      await FirebaseHelper.firebaseHelper
                          .uploadnotes(
                          titlecontroller.text, notecontroller.text)
                          .then((value) {
                        Get.snackbar('Success', 'Note Added Succesfully');
                        Get.back();
                      });
                    },
                    child: Text("Add")),
              ],
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: (homePageController.alldata!.isEmpty) ?
            // If alldata is empty, display a loading indicator or message
             Center(
              child: CircularProgressIndicator(),
            ):

            // If alldata is not empty, display the ListView
             ListView.builder(
              itemCount: homePageController.alldata!.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  "${homePageController.alldata![index].title}",
                  style: TextStyle(color: Colors.red),
                ),
                subtitle: Text(
                  "${homePageController.alldata![index].note}",
                ),
                trailing: Text(
                  "hey",
                ),
              ),
             )
    );
  }
}


