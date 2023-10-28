import 'package:flutter/material.dart';
import 'package:todo_list_sample/model/task_model.dart';
import 'package:todo_list_sample/utility/theme.dart';
import 'package:todo_list_sample/view/index/widget/select_category_dialog.dart';

class TaskCategoryRow extends StatefulWidget {
  const TaskCategoryRow({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  State<TaskCategoryRow> createState() => _TaskCategoryRowState();
}

class _TaskCategoryRowState extends State<TaskCategoryRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.local_offer_outlined,
              size: 28,
            ),
            const SizedBox(width: 16),
            Text(
              'Task Category:',
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
                builder: (context) => SelectCategoryDialog(
                  initialCategory: widget.task.category,
                  onSelected: (category) {
                    setState(() {
                      widget.task.category = category;
                    });
                  },
                ),
              );
            },
            child: Row(
              children: [
                ImageIcon(
                  CategoryFactory.categories[widget.task.category]!.image,
                  size: 20,
                  color: ColorSchemeFactory.categoriesIconColor[widget.task.category],
                ),
                const SizedBox(width: 16),
                Text(
                  widget.task.category,
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
