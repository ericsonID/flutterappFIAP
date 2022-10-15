import 'package:appabctech/pages/home_bind.dart';
import 'package:appabctech/pages/home_page.dart';
import 'package:appabctech/provider/assist_provider.dart';
import 'package:appabctech/services/assists_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}
void initService() {
  Get.lazyPut(()=>AssistsService(assistProvider: AssistProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter ABC Tech APP',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        textTheme:
          const TextTheme(headline4: TextStyle(color: Color.fromARGB(31, 243, 236, 236)) ),
      ),
      getPages: [
        GetPage(name: "/", page: ()=> const HomePage(),binding: HomeBind())
      ],
    );
  }
}