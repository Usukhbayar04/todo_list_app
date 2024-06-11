import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/controllers/task_controller.dart';
import 'package:todolist_app/screens/main_screen.dart';
import 'package:todolist_app/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'To-Do List App',
      theme: darkTheme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(TaskController());
      }),
    );
  }
}
