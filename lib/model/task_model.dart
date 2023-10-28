import 'package:todo_list_sample/model/model.dart';

class TaskModel extends IModel {
  String title;
  String category;
  String description;
  int priority;
  DateTime deadline;
  bool isDone = false;
  bool isDeleted = false;

  TaskModel({
    required this.title,
    required this.category,
    required this.description,
    required this.priority,
    required this.deadline,
    required this.isDone,
    required this.isDeleted,
  });

  @override
  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      category: map['category'] as String,
      description: map['description'] as String,
      priority: map['priority'] as int,
      deadline: DateTime.parse(map['deadline'] as String),
      isDone: map['isDone'] as bool,
      isDeleted: map['isDeleted'] as bool,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'category': category,
      'description': description,
      'priority': priority,
      'deadline': deadline.toString(),
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }
}
