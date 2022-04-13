import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  String title;
  @HiveField(1)
  String desc;
  @HiveField(2)
  bool done;
  Todo({
    this.title='',
    this.desc='',
    this.done = false,
  });
}
