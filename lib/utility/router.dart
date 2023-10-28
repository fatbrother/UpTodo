import 'package:flutter/material.dart';
import 'package:todo_list_sample/model/task_model.dart';
import 'package:todo_list_sample/utility/user.dart';
import 'package:todo_list_sample/view/index/task_page.dart';
import 'package:todo_list_sample/view/intro/intro_page.dart';
import 'package:todo_list_sample/view/index/index_page.dart';
import 'package:todo_list_sample/view/profile/profile_page.dart';

class RouteMap {
  static const String intro = '/intro';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String index = '/index';
  static const String profile = '/profile';
  static const String task = '/task';

  static String get initialRoute => User().isFirstTime ? intro : index;

  static Map<String, WidgetBuilder> routes = {
    intro: (context) => const IntroPage(),
    index: (context) => const IndexPage(),
    profile: (context) => const ProfilePage(),
    task: (context) {
      final args = ModalRoute.of(context)!.settings.arguments as TaskModel;
      return TaskPage(task: args);
    },
  };
}