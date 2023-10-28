import 'package:flutter/material.dart';
import 'package:todo_list_sample/model/task_model.dart';
import 'package:todo_list_sample/view/index/widget/dialog_bottom.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 300, 16, 300),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Delete Task',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Divider(
                color:
                    Theme.of(context).colorScheme.onTertiary.withOpacity(0.4),
                thickness: 2,
              ),
            ],
          ),
          Text(
            'Are you sure you want to delete this task?',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          DialogBottom(
            confirmText: 'Delete',
            onCancel: () => Navigator.pop(context),
            onConfirm: () {
              task.isDeleted = true;
              Navigator.pop(context);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
