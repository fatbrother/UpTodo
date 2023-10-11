import 'package:flutter/material.dart';
import 'package:todo_list_sample/view/index/widget/select_priority_dialog.dart';

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
    'Home': Image.asset('assets/icons/categories/home.png'),
    'Work': Image.asset('assets/icons/categories/work.png'),
    'Sport': Image.asset('assets/icons/categories/sport.png'),
    'Design': Image.asset('assets/icons/categories/design.png'),
    'University': Image.asset('assets/icons/categories/university.png'),
    'Social': Image.asset('assets/icons/categories/social.png'),
    'Music': Image.asset('assets/icons/categories/music.png'),
    'Health': Image.asset('assets/icons/categories/health.png'),
    'Movie': Image.asset('assets/icons/categories/movie.png'),
  };

  final List<Color> _categoriesColor = [
    const Color(0xFFFFCC80),
    const Color(0xFFFF9680),
    const Color(0xFF80FFFF),
    const Color(0xFF80FFD9),
    const Color(0xFF809CFF),
    const Color(0xFFFF80EB),
    const Color(0xFFFC80FF),
    const Color(0xFF80FFA3),
    const Color(0xFF80D1FF),
  ];

  final List<Color> _categoriesIconColor = [
    const Color(0xFFA36200),
    const Color(0xFFA31D00),
    const Color(0xFF00A32F),
    const Color(0xFF00A372),
    const Color(0xFF0055A3),
    const Color(0xFFA30089),
    const Color(0xFFA000A3),
    const Color(0xFF00A3A3),
    const Color(0xFF0069A3),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 150, 16, 150),
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
                              ? _categoriesColor[
                                  _categories.keys.toList().indexOf(item.key)]
                              : Theme.of(context)
                                  .colorScheme
                                  .background
                                  .withOpacity(0.4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ImageIcon(
                          item.value.image,
                          color: tmpCategory == item.key
                              ? _categoriesIconColor[
                                  _categories.keys.toList().indexOf(item.key)]
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
