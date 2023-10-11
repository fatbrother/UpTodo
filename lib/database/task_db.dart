import 'package:todo_list_sample/model/task_model.dart';
import 'package:todo_list_sample/database/db.dart';

class TaskDB extends ServiceBase<TaskModel>
    with QueryAll, Query, Update, Delete, Add {

  TaskDB._internal();

  static final TaskDB instance = TaskDB._internal();

  @override
  String get tableName => 'task';

  @override
  TaskModel fromMap(Map<String, dynamic> map) {
    return TaskModel.fromMap(map);
  }
}
