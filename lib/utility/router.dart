import 'package:flutter/material.dart';
import 'package:todo_list_sample/utility/account.dart';
import 'package:todo_list_sample/view/account/register_page.dart';
import 'package:todo_list_sample/view/intro/intro_page.dart';
import 'package:todo_list_sample/view/account/welcome_page.dart';
import 'package:todo_list_sample/view/account/login_page.dart';
import 'package:todo_list_sample/view/index/index_page.dart';
import 'package:todo_list_sample/view/profile/profile_page.dart';

class RouteMap {
  static const String intro = '/intro';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String index = '/index';
  static const String profile = '/profile';

  static String get initialRoute => Account().isSignedIn ? index : intro;

  static Map<String, WidgetBuilder> routes = {
    intro: (context) => const IntroPage(),
    welcome: (context) => const WelcomePage(),
    login: (context) => LoginPage(),
    register: (context) => RegisterPage(),
    index: (context) => const IndexPage(),
    profile: (context) => const ProfilePage(),
  };
}