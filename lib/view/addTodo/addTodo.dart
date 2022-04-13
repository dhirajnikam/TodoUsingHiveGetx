import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/todoController.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/container/containWidget.dart';
import 'package:todo/widgets/text/textWidget.dart';

class AddTodo extends StatelessWidget {
  AddTodo({Key? key}) : super(key: key);
  final controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      floatingActionButton: _floating(),
    );
  }

// body
  _body() {
    return GetBuilder<TodoController>(
      init: TodoController(),
      initState: (_) {},
      builder: (_) {
        return FadeInUp(
          duration: _duration(),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SafeArea(
              child: Column(
                children: [_top(), _title(), _desc()],
              ),
            ),
          ),
        );
      },
    );
  }

// top part of body
  _top() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonTheme1(
          tap: () {
            Get.back();
          },
        ),
        Expanded(child: Center(child: TextTitle(title: "Add Todo")))
      ],
    );
  }

// title Field
  _title() {
    return GetBuilder<TodoController>(
      init: TodoController(),
      initState: (_) {},
      builder: (_) {
        return TextField(
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Title",
              hintStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
          controller: _.titleController,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        );
      },
    );
  }

// desc textField
  _desc() {
    return GetBuilder<TodoController>(
      init: TodoController(),
      initState: (_) {},
      builder: (_) {
        return Container(
          width: Get.width,
          height: Get.height * 0.6,
          child: TextField(
            minLines: 1,
            maxLines: 8,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Description",
                hintStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            controller: _.desController,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        );
      },
    );
  }

// floating button
  _floating() {
    return GetBuilder<TodoController>(
      init: TodoController(),
      initState: (_) {},
      builder: (_) {
        return FadeInUp(
          duration: _duration(),
          child: FloatingActionButton.extended(
              onPressed: () {
                controller.createTodo(
                    todo: Todo(
                        title: _.titleController.text,
                        desc: _.desController.text));
                Get.back();
                _.titleController.clear();
                _.desController.clear();
              },
              label: TextTitle1(title: "Save")),
        );
      },
    );
  }

// Duration
  _duration() {
    return Duration(milliseconds: 1200);
  }
}
