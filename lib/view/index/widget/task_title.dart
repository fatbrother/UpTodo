import 'package:flutter/material.dart';
import 'package:todo_list_sample/model/task_model.dart';
import 'package:todo_list_sample/view/index/widget/dialog_bottom.dart';

class TaskTitle extends StatefulWidget {
  const TaskTitle({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  State<TaskTitle> createState() => _TaskTitleState();
}

class _TaskTitleState extends State<TaskTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                border: Border.fromBorderSide(
                  BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 24),
            Text(
              widget.task.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            IconButton(
              onPressed: () => _onEdit(context),
              icon: const Icon(
                Icons.edit_outlined,
                size: 32,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 24),
            Text(
              widget.task.description,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }

  void _onEdit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => EditTaskDialog(
        originalTitle: widget.task.title,
        originalDescription: widget.task.description,
        onEdit: (title, description) {
          setState(() {
            widget.task.title = title;
            widget.task.description = description;
          });
        },
      ),
    );
  }
}

class EditTaskDialog extends StatelessWidget {
  EditTaskDialog({
    super.key,
    required this.onEdit,
    required this.originalTitle,
    required this.originalDescription,
  });

  final String originalTitle;
  final String originalDescription;
  final void Function(String, String) onEdit;

  late final TextEditingController _titleController =
      TextEditingController(text: originalTitle);
  late final TextEditingController _descriptionController =
      TextEditingController(text: originalDescription);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Edit Task Title',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Divider(
              color: Theme.of(context).colorScheme.onTertiary.withOpacity(0.4),
              thickness: 2,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    keyboardAppearance: Brightness.dark,
                    controller: _titleController,
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      _titleController.text = value;
                    },
                    style: Theme.of(context).textTheme.bodySmall,
                    cursorColor: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.5),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    keyboardAppearance: Brightness.dark,
                    controller: _descriptionController,
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      _descriptionController.text = value;
                    },
                    style: Theme.of(context).textTheme.bodySmall,
                    cursorColor: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            DialogBottom(
              onCancel: () => Navigator.pop(context),
              onConfirm: () {
                onEdit(
                  _titleController.text,
                  _descriptionController.text,
                );
                Navigator.pop(context);
              },
              confirmText: 'Edit',
            )
          ],
        ),
      ),
    );
  }
}
