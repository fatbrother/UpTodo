import 'package:flutter/material.dart';
import 'package:todo_list_sample/utility/theme.dart';
import 'package:todo_list_sample/view/index/widget/dialog_bottom.dart';

class SelectCategoryDialog extends StatefulWidget {
  const SelectCategoryDialog({
    super.key,
    required this.onSelected,
    this.initialCategory = '',
  });

  final void Function(String) onSelected;
  final String initialCategory;

  @override
  State<SelectCategoryDialog> createState() => _SelectCategoryDialogState();
}

class _SelectCategoryDialogState extends State<SelectCategoryDialog> {
  late String tmpCategory = widget.initialCategory;

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
              'Choose Category',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Divider(
              color: Theme.of(context).colorScheme.onTertiary.withOpacity(0.4),
              thickness: 2,
            ),
            Wrap(
              spacing: 24,
              runSpacing: 8,
              children: [
                for (final item in CategoryFactory.categories.entries)
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tmpCategory = item.key;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            color: tmpCategory == item.key
                                ? ColorSchemeFactory.categoriesColor[item.key]
                                : Theme.of(context)
                                    .colorScheme
                                    .background
                                    .withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ImageIcon(
                            item.value.image,
                            color: tmpCategory == item.key
                                ? ColorSchemeFactory.categoriesIconColor[item.key]
                                : Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ),
                      Text(
                        item.key,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 12),
            DialogBottom(
              onCancel: () => Navigator.pop(context),
              onConfirm: () {
                widget.onSelected(tmpCategory);
                Navigator.pop(context);
              },
              confirmText: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
