import 'package:todo_list_sample/model/model.dart';
import 'package:todo_list_sample/model/task_model.dart';
import 'dart:convert';

class UserModel extends IModel {
  String name;
  String headshotPath;
  List<TaskModel> tasks;
  bool isFirstTime;

  UserModel({
    this.name = '',
    this.headshotPath = '',
    this.tasks = const [],
    this.isFirstTime = true,
  });

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'] ?? '',
      headshotPath: data['headshotPath'] ?? '',
      tasks: data['tasks'] != null
          ? List<TaskModel>.from(
              data['tasks'].map((e) => TaskModel.fromMap(e)).toList())
          : [],
      isFirstTime: data['isFirstTime'] ?? true,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'headshotPath': headshotPath,
      'tasks': tasks.map((e) => e.toMap()).toList(),
      'isFirstTime': isFirstTime,
    };
  }

  String toJson() {
    return json.encode(toMap());
  }
}
