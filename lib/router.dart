import 'package:flutter/material.dart';
import 'package:todo_list_sample/utilities/account.dart';
import 'package:todo_list_sample/views/account/register_page.dart';
import 'package:todo_list_sample/views/intro/intro_page.dart';
import 'package:todo_list_sample/views/account/welcome_page.dart';
import 'package:todo_list_sample/views/account/login_page.dart';
import 'package:todo_list_sample/views/main/index_page.dart';

class RouteMap {
  static const String intro = '/intro';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String index = '/index';

  static String get initialRoute => Account().isSignedIn ? index : intro;

  static Map<String, WidgetBuilder> routes = {
    intro: (context) => const IntroPage(),
    welcome: (context) => const WelcomePage(),
    login: (context) => LoginPage(),
    register: (context) => RegisterPage(),
    index: (context) => const IndexPage(),
  };
}