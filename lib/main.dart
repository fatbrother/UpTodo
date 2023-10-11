import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_sample/utility/firebase_options.dart';
import 'package:todo_list_sample/utility/router.dart';
import 'package:todo_list_sample/utility/theme.dart';

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
