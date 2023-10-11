import 'package:todo_list_sample/database/db.dart';
import 'package:todo_list_sample/model/user_model.dart';

class UserDB extends ServiceBase<UserModel> with Query, Add, Update {
  UserDB._internal();

  static final UserDB instance = UserDB._internal();
  
  @override
  UserModel fromMap(Map<String, dynamic> map) {
    return UserModel.fromMap(map);
  }

  @override
  String get tableName => 'users';
}
