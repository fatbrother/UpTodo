import 'package:flutter/material.dart';
import 'package:todo_list_sample/utility/router.dart';
import 'package:todo_list_sample/utility/theme.dart';
import 'package:todo_list_sample/utility/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await User().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UpTodo',
      theme: ThemeFactory.createThemeData(),
      routes: RouteMap.routes,
      initialRoute: RouteMap.initialRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
