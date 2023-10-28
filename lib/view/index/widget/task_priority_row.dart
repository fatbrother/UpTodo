import 'package:flutter/material.dart';
import 'package:todo_list_sample/model/task_model.dart';
import 'package:todo_list_sample/view/index/widget/select_priority_dialog.dart';

class TaskPriorityRow extends StatefulWidget {
  const TaskPriorityRow({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  State<TaskPriorityRow> createState() => _TaskPriorityRowState();
}

class _TaskPriorityRowState extends State<TaskPriorityRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.flag_outlined,
              size: 28,
            ),
            const SizedBox(width: 16),
            Text(
              'Task Priority:',
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
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => SelectPriorityDialog(
                  onSelected: (priority) {
                    setState(
                      () {
                        widget.task.priority = priority;
                      },
                    );
                  },
                  initialPriority: widget.task.priority,
                ),
              );
            },
            child: Row(
              children: [
                const Icon(
                  Icons.flag_outlined,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.task.priority.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
