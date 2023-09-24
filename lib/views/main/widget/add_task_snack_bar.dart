import 'package:flutter/material.dart';
import 'package:todo_list_sample/views/main/widget/select_priority_dialog.dart';

class AddTaskSnackBar extends SnackBar {
  AddTaskSnackBar({
    required BuildContext context,
    super.key,
  }) : super(
          duration: const Duration(days: 1),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          content: const AddTaskSnackBarContent(),
        );
}

class AddTaskSnackBarContent extends StatefulWidget {
  const AddTaskSnackBarContent({
    super.key,
  });

  @override
  State<AddTaskSnackBarContent> createState() => _AddTaskSnackBarContentState();
}

class _AddTaskSnackBarContentState extends State<AddTaskSnackBarContent> {
  DateTime? _selectedDate;
  final SelectPriorityDialogController _priorityController =
      SelectPriorityDialogController();
  final SelectCategoryDialogController _categoryController =
      SelectCategoryDialogController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Task',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        TextField(
          autofocus: true,
          keyboardAppearance: Brightness.dark,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            hintText: 'Title',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                width: 2,
                color: Theme.of(context).colorScheme.onTertiary,
              ),
            ),
          ),
        ),
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Description',
            contentPadding: const EdgeInsets.all(8),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                width: 2,
                color: Theme.of(context).colorScheme.onTertiary,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => _onOpenCalendar(context),
                    icon: const Icon(Icons.calendar_month_outlined, size: 24)),
                IconButton(
                    onPressed: () => _onSelectCategory(context),
                    icon: const Icon(Icons.label_important_outline_rounded,
                        size: 24)),
                IconButton(
                    onPressed: () => _onSelectPriority(context),
                    icon: const Icon(Icons.flag_outlined, size: 24)),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send_outlined,
                size: 24,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ],
        )
      ],
    );
  }

  void _onOpenCalendar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    ).then((value) {
      setState(() {
        _selectedDate = value;
      });
    });
  }

  void _onSelectCategory(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SelectCategoryDialog(
        controller: _categoryController,
      ),
    );
  }

  void _onSelectPriority(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SelectPriorityDialog(
        controller: _priorityController,
      ),
    );
  }
}

class SelectCategoryDialogController {
  SelectCategoryDialogController();
  String category = 'None';
}

class SelectCategoryDialog extends StatefulWidget {
  SelectCategoryDialog({
    super.key,
    SelectCategoryDialogController? controller,
  }) : controller = controller ?? SelectCategoryDialogController();

  final SelectCategoryDialogController controller;

  @override
  State<SelectCategoryDialog> createState() => _SelectCategoryDialogState();
}

class _SelectCategoryDialogState extends State<SelectCategoryDialog> {
  late String tmpCategory = widget.controller.category;
  final Map<String, Image> _categories = {
    'Work': Image.asset('assets/images/categories/work.png'),
    'Sport': Image.asset('assets/images/categories/sport.png'),
    'Design': Image.asset('assets/images/categories/design.png'),
    'University': Image.asset('assets/images/categories/university.png'),
    'Social': Image.asset('assets/images/categories/social.png'),
    'Music': Image.asset('assets/images/categories/music.png'),
    'Health': Image.asset('assets/images/categories/health.png'),
    'Movie': Image.asset('assets/images/categories/movie.png'),
    'Home': Image.asset('assets/images/categories/home.png'),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 100, 16, 100),
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
            'Choose Category',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Divider(
            color: Theme.of(context).colorScheme.onTertiary.withOpacity(0.4),
            thickness: 2,
          ),
          Wrap(
            spacing: 24,
            runSpacing: 12,
            children: [
              for (final item in _categories.entries)
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
                              ? Theme.of(context).colorScheme.tertiary
                              : Theme.of(context)
                                  .colorScheme
                                  .background
                                  .withOpacity(0.4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          IconData(item.value.hashCode),
                          size: 40,
                          color: tmpCategory == item.key
                              ? Theme.of(context).colorScheme.onTertiary
                              : Theme.of(context)
                                  .colorScheme
                                  .onTertiary
                                  .withOpacity(0.4),
                        ),
                      ),
                    ),
                  ],
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
                    widget.controller.category = tmpCategory;
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
