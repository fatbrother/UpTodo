import 'package:todo_list_sample/model/model.dart';

class UserModel extends IModel {
  @override
  String id;
  String name;
  String headshotId;
  List<String> taskIds;

  UserModel({
    this.id = '',
    this.name = '',
    this.headshotId = '',
    this.taskIds = const [],
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      headshotId: data['headshotId'] ?? '',
      taskIds: data['taskIds'] ?? [],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'headshotId': headshotId,
      'taskIds': taskIds,
    };
  }
}
