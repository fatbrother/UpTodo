import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list_sample/model/task_model.dart';
import 'package:todo_list_sample/model/user_model.dart';

class User {
  User._internal();

  factory User() => _instance;

  static final User _instance = User._internal();

  UserModel? _user;

  Future<void> init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    final String path = join(appDocumentDirectory.path, 'user.json');
    final bool isFileExists = File(path).existsSync();
    if (!isFileExists) {
      _user = UserModel();
      final File file = File(path);
      file.writeAsStringSync(
        _user!.toJson(),
        flush: true,
      );
    } else {
      final source = File(path).readAsStringSync();
      _user = UserModel.fromJson(source);
    }
  }

  void _save() async {
    final appDocumentDirectory = getApplicationDocumentsDirectory();
    appDocumentDirectory.then((value) {
      final String path = join(value.path, 'user.json');
      final File file = File(path);
      file.writeAsString(
        _user!.toJson(),
        flush: true,
      );
    });
  }

  String get name => _user!.name;
  set name(String name) {
    _user!.name = name;
    _save();
  }

  Image get headshot {
    if (_user!.headshotPath.isEmpty) {
      return const Image(
        image: AssetImage('assets/images/default_avatar.png')
      );
    } else {
      return Image.file(
        File(_user!.headshotPath),
      );
    }
  }

  set headshotPath(String headshotPath) {
    if (_user!.headshotPath.isNotEmpty && _user!.headshotPath != headshotPath) {
      final File file = File(_user!.headshotPath);
      file.delete();
    }
    _user!.headshotPath = headshotPath;
    _save();
  }

  List<TaskModel> get tasks => _user!.tasks;
  set tasks(List<TaskModel> tasks) {
    tasks.removeWhere((element) => element.isDeleted);
    _user!.tasks = tasks;
    _save();
  }

  void addTask(TaskModel task) {
    _user!.tasks.add(task);
    _save();
  }

  bool get isFirstTime {
    return _user!.isFirstTime;
  }

  set isFirstTime(bool isFirstTime) {
    _user!.isFirstTime = isFirstTime;
    _save();
  }

  int get completedTasksCount {
    int count = 0;
    for (final task in tasks) {
      if (task.isDone) {
        count++;
      }
    }
    return count;
  }

  int get uncompletedTasksCount {
    int count = 0;
    for (final task in tasks) {
      if (!task.isDone) {
        count++;
      }
    }
    return count;
  }
}
