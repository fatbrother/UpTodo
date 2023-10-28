import 'package:flutter/material.dart';
import 'package:todo_list_sample/model/task_model.dart';
import 'package:todo_list_sample/utility/date_time_extension.dart';
import 'package:todo_list_sample/utility/theme.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.onTap,
  });

  final TaskModel task;
  final void Function() onTap;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          padding: const EdgeInsets.only(
            top: 4,
            right: 12,
            bottom: 4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16, right: 8),
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
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        widget.task.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          widget.task.deadline.toMyString(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorSchemeFactory
                                .categoriesColor[widget.task.category],
                          ),
                          child: Row(
                            children: [
                              ImageIcon(
                                  CategoryFactory
                                      .categories[widget.task.category]?.image,
                                  color: ColorSchemeFactory
                                      .categoriesIconColor[widget.task.category]),
                              const SizedBox(width: 8),
                              Text(widget.task.category),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.5),
                                width: 2,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.flag_outlined),
                              const SizedBox(width: 4),
                              Text(
                                widget.task.priority.toString(),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
