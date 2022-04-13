import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/models/todo.g.dart';
import 'package:todo/view/addTodo/addTodo.dart';
import 'package:todo/view/todoList/todoList.dart';
import 'repository/box_repository.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await BoxRepository.openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  TodoList(),
    );
  }
}
