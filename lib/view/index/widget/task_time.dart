import 'package:flutter/material.dart';
import 'package:todo_list_sample/model/task_model.dart';
import 'package:todo_list_sample/utility/date_time_extension.dart';

class TaskTimeRow extends StatelessWidget {
  const TaskTimeRow({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.timer_outlined,
              size: 28,
            ),
            const SizedBox(width: 16),
            Text(
              'Task Time:',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Text(
            task.deadline.toMyString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
