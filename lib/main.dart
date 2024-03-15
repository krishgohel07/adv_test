import 'package:adv_flutter_test/firebase_options.dart';
import 'package:adv_flutter_test/modul/views/homepage/screen/homepage.dart';
import 'package:adv_flutter_test/modul/views/splash/screen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/', page: ()=>HomePage()),
        GetPage(name: '/splash', page: ()=>SplashScreen())
      ],
    );
  }
}
