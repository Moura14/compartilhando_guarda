import 'package:compartilhando_gurda/controls/user_control.dart';
import 'package:compartilhando_gurda/pages_guarda/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(UserControls());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Compartilhando a guarda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: PagesRoute.signIn,
      getPages: AppPages.pages,
    );
  }
}
