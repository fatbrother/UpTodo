import 'package:flutter/material.dart';
import 'package:todo_list_sample/utility/router.dart';
import 'package:todo_list_sample/view/index/widget/add_task_snack_bar.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool _isSnackBarVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list, size: 36),
        ),
        title: Center(
          child: Text(
            'Index',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: gotoProfile,
            child: const CircleAvatar(
              radius: 25,
              foregroundImage:
                  AssetImage('assets/images/default_avatar.png'),
            ),
          ),
          const SizedBox(width: 8),
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/index.png', height: 300),
          Text(
            'What do you want to do today?',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Text(
            'Tap + to add your tasks',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      )),
      floatingActionButton: AnimatedRotation(
        duration: const Duration(milliseconds: 1000),
        turns: _isSnackBarVisible ? 0.25 : 0,
        curve: Curves.easeInOut,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () => _onAddButtonPressed(context),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          child: Icon(
            _isSnackBarVisible ? Icons.close : Icons.add,
            size: 36,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _onAddButtonPressed(BuildContext context) {
    if (_isSnackBarVisible) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      setState(() => _isSnackBarVisible = false);
      return;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(AddTaskSnackBar(context: context));
    setState(() => _isSnackBarVisible = true);
  }

  void gotoProfile() {
    Navigator.pushNamed(context, RouteMap.profile);
  }
}
