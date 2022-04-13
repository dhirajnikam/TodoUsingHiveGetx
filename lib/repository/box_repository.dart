import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/models/todo.dart';

class BoxRepository {
  static const String boxName = "TODO";

  static openBox() async => await Hive.openBox<Todo>(boxName);

  static Box getBox() => Hive.box<Todo>(boxName);

  static closeBox() async => await Hive.box(boxName).close();
}
