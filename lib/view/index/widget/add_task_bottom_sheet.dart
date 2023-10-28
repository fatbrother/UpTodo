import 'package:flutter/material.dart';
import 'package:todo_list_sample/model/task_model.dart';
import 'package:todo_list_sample/view/index/widget/select_category_dialog.dart';
import 'package:todo_list_sample/view/index/widget/select_priority_dialog.dart';

class AddTaskSnackBarBottomSheet extends StatefulWidget {
  const AddTaskSnackBarBottomSheet({
    super.key,
    required this.onAddTask,
  });

  final void Function(TaskModel) onAddTask;

  @override
  State<AddTaskSnackBarBottomSheet> createState() =>
      _AddTaskSnackBarBottomSheetState();
}

class _AddTaskSnackBarBottomSheetState
    extends State<AddTaskSnackBarBottomSheet> {
  final TaskModel _task = TaskModel(
    title: '',
    category: '',
    description: '',
    priority: 0,
    deadline: DateTime.now(),
    isDone: false,
    isDeleted: false,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Task',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          TextField(
            keyboardAppearance: Brightness.dark,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              hintText: 'Title',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  width: 2,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
              border: InputBorder.none,
            ),
            cursorColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            onChanged: (value) => _task.title = value,
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Description',
              contentPadding: const EdgeInsets.all(8),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  width: 2,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
              border: InputBorder.none,
            ),
            cursorColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            onChanged: (value) => _task.description = value,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () => _onOpenCalendar(context),
                      icon: const Icon(Icons.timer_outlined, size: 24)),
                  IconButton(
                      onPressed: () => _onSelectCategory(context),
                      icon: const Icon(Icons.local_offer_outlined, size: 24)),
                  IconButton(
                      onPressed: () => _onSelectPriority(context),
                      icon: const Icon(Icons.flag_outlined, size: 24)),
                ],
              ),
              IconButton(
                onPressed: _onAddTask,
                icon: Icon(
                  Icons.send_outlined,
                  size: 24,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _onOpenCalendar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: _task.deadline,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Theme.of(context).colorScheme.tertiary,
              ),
        ),
        child: child!,
      ),
    ).then((value) {
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_task.deadline),
        builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Theme.of(context).colorScheme.tertiary,
                ),
          ),
          child: child!,
        ),
      ).then((time) {
        setState(() {
          _task.deadline = DateTime(
            value!.year,
            value.month,
            value.day,
            time!.hour,
            time.minute,
          );
        });
      });
    });
  }

  void _onSelectCategory(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SelectCategoryDialog(
        initialCategory: _task.category,
        onSelected: (category) => setState(() {
          _task.category = category;
        }),
      ),
    );
  }

  void _onSelectPriority(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SelectPriorityDialog(
        initialPriority: _task.priority,
        onSelected: (priority) => setState(() {
          _task.priority = priority;
        }),
      ),
    );
  }

  bool _isTaskValid() {
    return _task.title.isNotEmpty &&
        _task.description.isNotEmpty &&
        _task.category.isNotEmpty;
  }

  void _onAddTask() {
    if (_isTaskValid()) {
      widget.onAddTask(_task);
      Navigator.of(context).pop();
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text('Please fill all fields',
              style: Theme.of(context).textTheme.bodySmall),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK', style: Theme.of(context).textTheme.bodyLarge),
            ),
          ],
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
      );
    }
  }
}
