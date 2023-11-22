import 'package:flutter/material.dart';
import 'package:todo_list_sample/model/task_model.dart';
import 'package:todo_list_sample/utility/date_time_extension.dart';
import 'package:todo_list_sample/utility/router.dart';
import 'package:todo_list_sample/utility/user.dart';
import 'package:todo_list_sample/view/index/widget/task_card.dart';

class IndexBody extends StatefulWidget {
  const IndexBody({
    super.key,
    required this.tasks,
  });

  final List<TaskModel> tasks;

  @override
  State<IndexBody> createState() => _IndexBodyState();
}

class _IndexBodyState extends State<IndexBody> {
  final List<String> _status = ['Today', 'All'];
  String _selectedStatus = 'All';
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    widget.tasks.sort((a, b) => b.deadline.compareTo(a.deadline));
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              hintText: 'Search for your task...',
              hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.5)),
              prefixIcon: Icon(Icons.search,
                  size: 36,
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.5)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.surface,
                    width: 2,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.surface,
                    width: 2,
                  )),
              fillColor: Theme.of(context).colorScheme.surface.withOpacity(0.4),
              filled: true,
            ),
            onChanged: (value) => setState(() => _searchText = value),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: DropdownButton(
              value: _selectedStatus,
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 36,
              elevation: 16,
              underline: const SizedBox(),
              style: Theme.of(context).textTheme.bodyLarge,
              onChanged: (String? newValue) {
                setState(() => _selectedStatus = newValue!);
              },
              items: _status.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child:
                      Text(value, style: Theme.of(context).textTheme.bodySmall),
                );
              }).toList(),
              dropdownColor: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                for (final task in widget.tasks)
                  if (_isMatched(task))
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TaskCard(
                        task: task,
                        onTap: () => _onGotoTaskPage(task),
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _isMatched(TaskModel task) {
    if (task.isDone) {
      return false;
    }
    if (_selectedStatus == 'Today' && !task.deadline.isToday) {
      return false;
    }
    if (_searchText != '' &&
        !task.title.toLowerCase().contains(_searchText.toLowerCase())) {
      return false;
    }
    return true;
  }

  void _onGotoTaskPage(TaskModel task) {
    Navigator.pushNamed(context, Pages.task, arguments: task).then(
      (value) {
        setState(
          () {
            User().tasks = widget.tasks;
          },
        );
      },
    );
  }
}
