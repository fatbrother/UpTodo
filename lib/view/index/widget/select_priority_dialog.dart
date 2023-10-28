import 'package:flutter/material.dart';
import 'package:todo_list_sample/view/index/widget/dialog_bottom.dart';

class SelectPriorityDialog extends StatefulWidget {
  const SelectPriorityDialog({
    super.key,
    required this.onSelected,
    this.initialPriority = 0,
  });

  final void Function(int) onSelected;
  final int initialPriority;

  @override
  State<SelectPriorityDialog> createState() => _SelectPriorityDialogState();
}

class _SelectPriorityDialogState extends State<SelectPriorityDialog> {
  late int tmpPriority = widget.initialPriority;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
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
              'Task Priority',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Divider(
              color: Theme.of(context).colorScheme.onTertiary.withOpacity(0.4),
              thickness: 2,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                for (int i = 0; i < 10; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tmpPriority = i;
                      });
                    },
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        color: tmpPriority == i
                            ? Theme.of(context).colorScheme.tertiary
                            : Theme.of(context)
                                .colorScheme
                                .background
                                .withOpacity(0.4),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                  ),
              ],
            ),
            const SizedBox(height: 16),
            DialogBottom(
              onConfirm: () {
                widget.onSelected(tmpPriority);
                Navigator.pop(context);
              },
              onCancel: () => Navigator.pop(context),
              confirmText: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
