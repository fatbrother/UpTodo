import 'package:flutter/material.dart';
import 'package:todo_list_sample/model/task_model.dart';
import 'package:todo_list_sample/view/index/widget/delete_dialog.dart';
import 'package:todo_list_sample/view/index/widget/task_categort_row.dart';
import 'package:todo_list_sample/view/index/widget/task_priority_row.dart';
import 'package:todo_list_sample/view/index/widget/task_time.dart';
import 'package:todo_list_sample/view/index/widget/task_title.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close, size: 36),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TaskTitle(task: task),
                const SizedBox(height: 48),
                TaskTimeRow(task: task),
                const SizedBox(height: 24),
                TaskCategoryRow(task: task),
                const SizedBox(height: 24),
                TaskPriorityRow(task: task),
                const SizedBox(height: 96),
                DeleteTaskRow(task: task),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                task.isDone = true;
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Container(
                width: double.infinity,
                height: 64,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Complete Task',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteTaskRow extends StatelessWidget {
  const DeleteTaskRow({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onDeleteTask(context, task),
      child: Row(
        children: [
          Icon(
            Icons.delete_forever_outlined,
            size: 28,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(width: 16),
          Text(
            'Delete Task',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
        ],
      ),
    );
  }

  void _onDeleteTask(BuildContext context, TaskModel task) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(task: task);
      },
    );
  }
}
