import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_sample/firebase_options.dart';
import 'package:todo_list_sample/router.dart';
import 'package:todo_list_sample/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
