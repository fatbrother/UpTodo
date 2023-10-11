import 'package:todo_list_sample/model/model.dart';

class TaskModel extends IModel {
  @override
  String id;
  String title;
  String description;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
