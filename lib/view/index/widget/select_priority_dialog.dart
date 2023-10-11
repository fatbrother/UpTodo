import 'package:flutter/material.dart';

class SelectPriorityDialogController {
  SelectPriorityDialogController();
  int priority = 0;
}

class SelectPriorityDialog extends StatefulWidget {
  SelectPriorityDialog({
    super.key,
    SelectPriorityDialogController? controller,
  }) : controller = controller ?? SelectPriorityDialogController();

  final SelectPriorityDialogController controller;

  @override
  State<SelectPriorityDialog> createState() => _SelectPriorityDialogState();
}

class _SelectPriorityDialogState extends State<SelectPriorityDialog> {
  late int tmpPriority = widget.controller.priority;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 200, 16, 200),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Task Priority',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Divider(
            color: Theme.of(context).colorScheme.onTertiary.withOpacity(0.4),
            thickness: 2,
          ),
          Wrap(
            children: [
              for (int i = 0; i < 10; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tmpPriority = i;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: tmpPriority == i
                          ? Theme.of(context).colorScheme.tertiary
                          : Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(0.4),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.flag_outlined,
                          size: 24,
                          color: tmpPriority == i
                              ? Theme.of(context).colorScheme.onTertiary
                              : Theme.of(context)
                                  .colorScheme
                                  .onTertiary
                                  .withOpacity(0.4),
                        ),
                        Text(
                          '$i',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    widget.controller.priority = tmpPriority;
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.all(8),
                  ),
                  child: Text(
                    'Save',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
