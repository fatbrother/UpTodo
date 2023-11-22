import 'package:flutter/material.dart';
import 'package:todo_list_sample/utility/router.dart';
import 'package:todo_list_sample/utility/user.dart';
import 'package:todo_list_sample/view/index/widget/add_task_bottom_sheet.dart';
import 'package:todo_list_sample/view/index/widget/empty_index_body.dart';
import 'package:todo_list_sample/view/index/widget/index_body.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        title: Text(
          'Index',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          GestureDetector(
            onTap: _gotoProfile,
            child: CircleAvatar(
              radius: 24,
              backgroundImage: User().headshot.image,
            ),
          ),
          const SizedBox(width: 8),
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      body: User().tasks.isEmpty
          ? const EmptyIndexBody()
          : IndexBody(tasks: User().tasks),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => _onAddButtonPressed(context),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Icon(
          Icons.add,
          size: 36,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
      ),
    );
  }

  void _onAddButtonPressed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (context) => AddTaskSnackBarBottomSheet(
        onAddTask: (task) => setState(() {
          User().addTask(task);
        }),
      ),
    );
  }

  void _gotoProfile() {
    Navigator.pushNamed(context, Pages.profile).then((value) {
      setState(() {});
    });
  }
}
