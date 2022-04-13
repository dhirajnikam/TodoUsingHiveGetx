import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/todoController.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/view/addTodo/addTodo.dart';
import 'package:todo/view/details/details.dart';
import 'package:todo/widgets/container/containWidget.dart';
import 'package:todo/widgets/text/textWidget.dart';

class TodoList extends StatelessWidget {
  TodoList({Key? key}) : super(key: key);
  final controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: _body(),
        floatingActionButton: _floating());
  }

// body
  _body() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_top(), _List()],
        ),
      ),
    );
  }

// top part of screen
  _top() {
    return GetBuilder<TodoController>(
      init: TodoController(),
      initState: (_) {},
      builder: (_) {
        return FadeInUp(
          duration: _duration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitle(title: "Task Manager"),
              Container(child: _.todoCount > 0 ? _notempty() : _ifempty()),
            ],
          ),
        );
      },
    );
  }

// if List not empty show this
  _notempty() {
    return GetBuilder<TodoController>(
      init: TodoController(),
      initState: (_) {},
      builder: (_) {
        return Column(
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            Container(child: TextTitle1(title: "You have ${_.todoCount} todo")),
            SizedBox(
              height: Get.height * 0.02,
            ),
          ],
        );
      },
    );
  }

// if List empty show this
  _ifempty() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.3,
          ),
          Center(
              child: InkWell(
                  onTap: () {
                    Get.to(AddTodo(),
                        transition: Transition.fadeIn, duration: _duration());
                  },
                  child: TextTitle1(title: "+ Add todo"))),
        ],
      ),
    );
  }

// todo List
  _List() {
    return GetBuilder<TodoController>(
      init: TodoController(),
      initState: (_) {},
      builder: (_) {
        return Expanded(
          child: FadeInUp(
            duration: _duration(),
            child: ListView.builder(
                itemCount: controller.todoCount,
                itemBuilder: ((context, index) {
                  Todo todo = _.observableBox.getAt(index);
                  return TodoContainer(
                    // check todo
                    done: todo.done
                        ? Icon(
                            Icons.check,
                            color: Colors.white,
                          )
                        : Container(),
                    // title
                    title: todo.title,
                    // tab to change
                    Donetap: () {
                      _.updateTodo(
                          index: index,
                          todo: Todo(
                              title: todo.title,
                              desc: todo.desc,
                              done: todo.done != false
                                  ? todo.done = false
                                  : todo.done = true));
                    },
                    //  Navigate to detail page
                    DetailTab: () {
                      Get.to(
                          Details(
                            desc: todo.desc,
                            title: todo.title,
                          ),
                          duration: _duration(),
                          transition: Transition.fadeIn);
                    },
                    // done line
                    color: todo.done != false ? Colors.amber : Colors.white,
                    //  done width
                    width: todo.done != false ? Get.width : Get.width * 0,
                    //  delete list
                    deleteTab: () {
                      _.deleteTodo(index: index);
                    },
                    //  color of check box
                    donecolor: todo.done != false ? Colors.black : Colors.white,
                  );
                })),
          ),
        );
      },
    );
  }

// floatind action button
  _floating() {
    return FadeInUp(
      duration: _duration(),
      child: FloatingActionButton(
        onPressed: () {
          Get.to(AddTodo(),
              transition: Transition.downToUp, duration: _duration());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

// duration
  _duration() {
    return const Duration(milliseconds: 1200);
  }
}
