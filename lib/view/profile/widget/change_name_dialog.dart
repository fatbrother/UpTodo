import 'package:flutter/material.dart';
import 'package:todo_list_sample/utility/user.dart';
import 'package:todo_list_sample/view/profile/widget/profile_text_field.dart';

class ChangeNameDialog extends StatelessWidget {
  ChangeNameDialog({
    super.key,
    required this.onNameChanged,
  });

  final void Function() onNameChanged;
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Change account name",
                style: Theme.of(context).textTheme.bodySmall),
            Divider(
                color:
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.5)),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ProfileTextField(
                  hintText: "User name", controller: _nameController),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _onNameChanged(_nameController.text);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      "Edit",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onNameChanged(String newName) async {
    final user = User();
    user.name = newName;
    onNameChanged();
  }
}
