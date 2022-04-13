import 'package:hive/hive.dart';
import 'package:todo/models/todo.dart';

class TodoAdapter extends TypeAdapter<Todo> {
  final int typeId = 0;
  @override
  Todo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Todo(
      title: fields[0] as String,
      desc: fields[1] as String,
      done: fields[2] as bool,
    );
  }

  @override
  // TODO: implement typeId
  int get hashCode => typeId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;

  @override
  void write(BinaryWriter writer, Todo obj) {
    // TODO: implement write
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.desc)
      ..writeByte(2)
      ..write(obj.done);
  }
}
