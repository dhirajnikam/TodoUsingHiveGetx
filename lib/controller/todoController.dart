import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/repository/box_repository.dart';

class TodoController extends GetxController {
  // Title Controller
  final TextEditingController titleController = TextEditingController();
  // Desc Controller
  final TextEditingController desController = TextEditingController();
  final Box _observableBox = BoxRepository.getBox();

  Box get observableBox => _observableBox;
  // todo count
  int get todoCount => _observableBox.length;
  // create todo
  createTodo({required Todo todo}) {
    _observableBox.add(todo);
    update();
  }

  // update todo
  updateTodo({required int index, required Todo todo}) {
    _observableBox.putAt(index, todo);
    update();
  }

  // delete todo
  deleteTodo({required int index}) {
    _observableBox.deleteAt(index);
    update();
  }
}
